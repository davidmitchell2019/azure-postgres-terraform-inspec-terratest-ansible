package test

import (
	"fmt"
	"testing"
	"time"
	"github.com/gruntwork-io/terratest/modules/retry"
	"github.com/gruntwork-io/terratest/modules/terraform"

)
func VerifyDB(t *testing.T, dbConfig DBConfig, db_name string) {
	dbConfig.database = db_name

	// It can take a minute or so for the database to boot up, so retry a few times
	maxRetries := 15
	timeBetweenRetries := 5 * time.Second
	description := fmt.Sprintf("Executing commands on database %s:%s", dbConfig.server, dbConfig.database)

	// Verify that we can connect to the database and run SQL commands
	retry.DoWithRetry(t, description, maxRetries, timeBetweenRetries, func() (string, error) {
		// Connect to specific database, i.e. mssql
		db := DBConnection(t, "postgres", dbConfig)
		cleanUpCommand := "drop table person"

		// Create a table
		creation := "create table person (id integer, name varchar(30), primary key (id))"
		DBExecution(t, db, creation, cleanUpCommand)

		// Insert a row
		expectedID := 12345
		expectedName := "azure"
		insertion := fmt.Sprintf("insert into person values (%d, '%s')", expectedID, expectedName)
		DBExecution(t, db, insertion, cleanUpCommand)

		// Query the table and check the output
		query := "select name from person"
		drop := "drop table person"
		isValid := DBQueryWithValidation(t, db, query, "azure")

		if !isValid {
		    DBExecution(t, db, drop, "")
		    db.Close()
		    t.Fail()
    	}
		DBExecution(t, db, drop, "")
		fmt.Println("Wrote the user azure to the new table, tested and then dropped the table")

		defer db.Close()

		return "", nil
	})
}
func TestTerraformPostgresql(t *testing.T) {
	t.Parallel()

	var dbNames = []string{"test"}
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "/Users/ddmc/PycharmProjects/azure-postgres",
	}

	// This will init and apply the resources and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Setting database configuration, including server name, user name, password and database name
	var dbConfig DBConfig
	dbConfig.server = terraform.Output(t, terraformOptions, "server_fqdn")
	var userTemp = terraform.Output(t, terraformOptions, "username")
	dbConfig.user = fmt.Sprintf("%s@%s", userTemp, dbConfig.server)
	dbConfig.password = terraform.Output(t, terraformOptions, "password")

	for _, dbName := range dbNames {
		VerifyDB(t, dbConfig, dbName)
	}
}
