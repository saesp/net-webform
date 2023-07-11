namespace net_webform.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class change : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Systems", "Notes", c => c.String(maxLength: 1000));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Systems", "Notes", c => c.String(nullable: false, maxLength: 1000));
        }
    }
}
