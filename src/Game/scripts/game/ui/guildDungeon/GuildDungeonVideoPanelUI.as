package game.ui.guildDungeon
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.guildDungeon.render.GuildDungeonVideoRenderUI;
   
   public class GuildDungeonVideoPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="343" height="321">
			  <PanelBgS3 width="340" height="320" panelDragEnabled="true" x="2" y="0" frameVisible="false" frameStyle="2"/>
			  <Image skin="png.uiGuildDungeon.img_videoBg" x="15" y="41"/>
			  <Image skin="png.a5.commonImgs.img_crown" x="73" y="49"/>
			  <List x="19" y="145" repeatY="5" width="122" height="90" var="list_best" spaceY="1">
			    <GuildDungeonVideoRender x="-22" y="-8" name="render" runtime="game.ui.guildDungeon.render.GuildDungeonVideoRenderUI"/>
			  </List>
			  <Label text="\l40710104" x="52" y="86" width="231" height="18" style="下划线黄色" align="center"/>
			  <Label text="击杀者" autoSize="left" x="109" y="53" width="52" height="18" style="普通说明" size="15"/>
			  <Label text="低调的优雅" autoSize="left" x="161" y="53" width="166" height="25" underline="false" var="txt_shoushaName" style="随品质变化" size="15" mouseChildren="true"/>
			  <Label text="\l41300090" x="22" y="120" width="54" height="18" style="下划线黄色" align="center"/>
			  <Label text="\l50200021" x="85" y="120" width="85" height="18" style="下划线黄色" align="center"/>
			  <Label text="\l40710405" x="205" y="120" width="69" height="18" style="下划线黄色" align="center"/>
			  <Label text="\l40710406" x="256" y="120" width="101" height="18" style="下划线黄色" align="center"/>
			  <Button skin="png.a5.commonImgs.btn_video" x="242" y="49" stateNum="1" width="25" height="25" var="btn_video"/>
			</PanelView>;
       
      
      public var list_best:List = null;
      
      public var txt_shoushaName:Label = null;
      
      public var btn_video:Button = null;
      
      public function GuildDungeonVideoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildDungeon.render.GuildDungeonVideoRenderUI"] = GuildDungeonVideoRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
