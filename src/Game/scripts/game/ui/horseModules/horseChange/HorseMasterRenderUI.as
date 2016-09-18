package game.ui.horseModules.horseChange
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HorseMasterRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="130" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_4" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="48" height="48"/>
			  <Label text="\l30300041" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="left" x="58" y="1" letterSpacing="1" height="36" align="left" style="普通说明" width="100" multiline="true" wordWrap="true"/>
			  <Label text="8/5" stroke="0xffffff" mouseEnabled="false" var="txt_countAndNeed" backgroundColor="0xcfbeaf" autoSize="none" align="left" x="59" y="35" height="16" style="重要提示绿"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function HorseMasterRenderUI()
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
