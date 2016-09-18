package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class GuildDungeonVideoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="305" height="30">
			  <Image skin="png.uiGuildDungeon.img_selected" x="0" y="0" name="selectBoxAll"/>
			  <Label x="14" width="30" height="18" var="txt_rank" underline="false" y="4" text="1" style="内容数字" align="center"/>
			  <Label autoSize="left" x="70" width="85" height="18" var="txt_name" y="4" text="低调调的优雅" style="内容数字" underline="false" isHtml="true" mouseChildren="true"/>
			  <Label x="180" width="84" height="18" var="txt_damage" y="5" text="5487895" style="内容数字" align="center"/>
			  <Button skin="png.a5.commonImgs.btn_video" x="276" y="2" stateNum="1" width="25" height="25" var="btn_video"/>
			</View>;
       
      
      public var txt_rank:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_damage:Label = null;
      
      public var btn_video:Button = null;
      
      public function GuildDungeonVideoRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
