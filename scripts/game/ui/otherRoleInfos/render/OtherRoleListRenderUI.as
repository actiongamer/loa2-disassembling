package game.ui.otherRoleInfos.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class OtherRoleListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="62" height="62">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56"/>
			  <Image skin="png.uiRoleTeam.lock" x="-3" y="-2" var="img_lock" buttonMode="false" mouseEnabled="false"/>
			  <Label text="25级开启" autoSize="none" x="-49" y="26" style="渐变2" width="164" wordWrap="false" align="center" var="txt_openLvl" isHtml="true" mouseEnabled="false" size="12" height="18"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_lock:Image = null;
      
      public var txt_openLvl:Label = null;
      
      public function OtherRoleListRenderUI()
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
