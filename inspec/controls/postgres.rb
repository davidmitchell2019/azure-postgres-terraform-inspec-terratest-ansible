#test to see that the Postgres server is created
control "postgres" do
  describe azurerm_postgresql_server(resource_group: input('resource_group'), server_name: input('server_name')) do
      it { should exist }
    end
end
