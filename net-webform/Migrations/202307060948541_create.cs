namespace net_webform.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class create : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Systems",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 100),
                        OrderDate = c.DateTime(nullable: false),
                        InsertionDate = c.DateTime(nullable: false),
                        ChangedDate = c.DateTime(nullable: false),
                        Notes = c.String(nullable: false, maxLength: 1000),
                        TypologyId = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Typologies", t => t.TypologyId)
                .Index(t => t.TypologyId);
            
            CreateTable(
                "dbo.Typologies",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Systems", "TypologyId", "dbo.Typologies");
            DropIndex("dbo.Systems", new[] { "TypologyId" });
            DropTable("dbo.Typologies");
            DropTable("dbo.Systems");
        }
    }
}
