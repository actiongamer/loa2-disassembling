package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class GuildDungeonFlagRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="100" buttonMode="true" mouseChildren="true">
			  <Label text="关卡名" x="-87" y="-161" width="173" height="18" style="随品质变化" var="txt_dungeonName" align="center" buttonMode="true"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S3" x="-41" y="-138" sizeGrid="2,0,10,0" var="progressBar_hp" buttonMode="true"/>
			  <Box x="-135" y="3" var="box_desc" buttonMode="true">
			    <Image skin="png.a5.commonImgs.文字底" x="45"/>
			    <Label text="击杀后全体攻击增加20%" y="1" width="271" height="38" style="加底标题" var="txt_buffDes" wordWrap="true" align="center" size="13"/>
			  </Box>
			  <Image skin="png.uiGuildDungeon.img_cross" x="-53" y="-124" var="img_cross"/>
			</View>;
       
      
      public var txt_dungeonName:Label = null;
      
      public var progressBar_hp:ProgressBar = null;
      
      public var box_desc:Box = null;
      
      public var txt_buffDes:Label = null;
      
      public var img_cross:Image = null;
      
      public function GuildDungeonFlagRenderUI()
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
