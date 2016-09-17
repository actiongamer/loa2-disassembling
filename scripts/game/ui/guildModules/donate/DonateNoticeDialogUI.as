package game.ui.guildModules.donate
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class DonateNoticeDialogUI extends View
   {
      
      protected static var uiView:XML = <View width="515" height="71">
			  <Image skin="png.uiGuildModule.donate.说话9宫格" x="-4" y="2" sizeGrid="80,10,10,50" width="519" height="69" var="img_bg"/>
			  <Label text="当天捐献进度" autoSize="left" x="14" y="13" style="普通说明" var="txt_notice"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_notice:Label = null;
      
      public function DonateNoticeDialogUI()
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
