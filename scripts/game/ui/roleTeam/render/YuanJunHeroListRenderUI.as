package game.ui.roleTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class YuanJunHeroListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="62" height="62" buttonMode="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56"/>
			  <Image skin="png.a5.commonImgs.img_lock" x="16" y="12" var="img_lock" buttonMode="false" mouseEnabled="false"/>
			  <Image skin="png.uiRoleTeam.加号" x="20" y="22" var="img_plus" mouseEnabled="false" width="22" height="22"/>
			  <Label text="人名\n白色" autoSize="none" x="0" y="16" style="普通说明" width="60" multiline="true" wordWrap="true" align="center" var="txt_openLvl" isHtml="true" mouseEnabled="false" mouseChildren="false" height="42"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="51" y="-5" var="img_redPoint"/>
			  <Label text="随品质变化" autoSize="none" x="-32" y="65" style="随品质变化" width="126" height="18" align="center" var="txt_name" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="2" y="2" anchorX="0.5" anchorY="0.5" var="img_group" autoSize="false" smoothing="true" mouseEnabled="true" mouseChildren="false" width="24" height="24"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_lock:Image = null;
      
      public var img_plus:Image = null;
      
      public var txt_openLvl:Label = null;
      
      public var img_redPoint:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_group:Image = null;
      
      public function YuanJunHeroListRenderUI()
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
