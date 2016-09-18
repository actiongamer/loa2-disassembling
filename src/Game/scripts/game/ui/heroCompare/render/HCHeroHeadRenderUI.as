package game.ui.heroCompare.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class HCHeroHeadRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender buttonMode="true" width="62" height="62">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="对方英雄" autoSize="none" x="5" y="43" style="普通灰色" width="53" height="20" multiline="true" wordWrap="true" align="center" var="txt_herodesc" isHtml="true" mouseEnabled="false"/>
			  <Image skin="png.uiRoleTeam.加号" x="20" y="21" var="img_plus" mouseEnabled="true" buttonMode="true"/>
			  <Button skin="png.uiHeroCompare.btn_close2" x="31" y="-3" stateNum="1" var="btn_close"/>
			  <Image skin="png.uiHeroCompare.名字透明黑底" x="-29" y="65"/>
			  <Label text="名字名字名字 + 8" autoSize="center" x="-23" y="67" style="普通灰色" width="106" height="20" multiline="true" wordWrap="true" align="center" var="txt_name" isHtml="true" mouseEnabled="false"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_herodesc:Label = null;
      
      public var img_plus:Image = null;
      
      public var btn_close:Button = null;
      
      public var txt_name:Label = null;
      
      public function HCHeroHeadRenderUI()
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
