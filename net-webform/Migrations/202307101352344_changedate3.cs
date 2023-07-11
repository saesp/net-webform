namespace net_webform.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class changedate3 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Systems", "OrderDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.Systems", "InsertionDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.Systems", "ChangedDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Systems", "ChangedDate", c => c.DateTimeOffset(nullable: false, precision: 7));
            AlterColumn("dbo.Systems", "InsertionDate", c => c.DateTimeOffset(nullable: false, precision: 7));
            AlterColumn("dbo.Systems", "OrderDate", c => c.DateTimeOffset(nullable: false, precision: 7));
        }
    }
}
