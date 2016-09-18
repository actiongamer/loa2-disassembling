package game.ui.heroChooseModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HeroGroupRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="137" height="196" buttonMode="true">
			  <Image skin="png.a5.comps.img_block" x="1" y="-1" width="136" height="196" var="img_bg"/>
			  <Image skin="png.a5.comps.img_block" x="69.5" y="62" var="img_icon" anchorX="0.5" anchorY="0.5"/>
			  <Label text="风暴大陆" x="36.5" y="161" style="普通说明" height="18" var="txt_title" align="center" centerX="0"/>
			  <Image skin="png.uiHeroChoose.img_disable" x="46" y="36" var="img_disable"/>
			  <Image skin="png.a5.commonImgs.img_chooseFrame" x="-15" y="-16" mouseEnabled="false" mouseChildren="false" name="selectBox0" width="168" height="220" sizeGrid="20,20,20,20"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_title:Label = null;
      
      public var img_disable:Image = null;
      
      public function HeroGroupRenderUI()
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
