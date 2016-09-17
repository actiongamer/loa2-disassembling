package game.ui.otherRoleInfos.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class OtherRoleYuanJunRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="62" height="62">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56"/>
			  <Image skin="png.a5.commonImgs.img_lock" x="16" y="12" var="img_lock" buttonMode="false" mouseEnabled="false"/>
			  <Label text="人名\n白色" autoSize="none" x="4" y="16" style="普通说明" width="53" height="43" multiline="true" wordWrap="true" align="center" leading="3" var="txt_openLvl" isHtml="true" mouseEnabled="false"/>
			  <Label text="随品质变化" autoSize="none" x="-44" y="65" style="随品质变化" width="150" height="18" align="center" var="txt_name" mouseEnabled="false"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_lock:Image = null;
      
      public var txt_openLvl:Label = null;
      
      public var txt_name:Label = null;
      
      public function OtherRoleYuanJunRenderUI()
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
