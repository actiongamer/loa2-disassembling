package game.ui.recycleModules.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   
   public class RecSelectHeroRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="242" height="89" buttonMode="true">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS2" x="2" y="1" width="240" height="88" sizeGrid="80,40,80,40"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="15" y="16" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			  <Image skin="png.comp.image" x="18" y="19" var="img_icon" width="54" height="54"/>
			  <CheckBox x="202" y="51" var="selectedFlag" buttonMode="false" mouseEnabled="false" style="CheckBox普通"/>
			  <Image skin="png.uiRecycle.小框分割线" x="81" y="28"/>
			  <Box x="84" y="11" mouseChildren="false" mouseEnabled="false">
			    <Label text="普罗米修斯" autoSize="left" style="普通说明" width="140" height="18" var="txt_name" mouseEnabled="false"/>
			    <Label text="等级" autoSize="left" x="1" y="21" style="普通说明" width="111" height="18" var="txt_lvl" mouseEnabled="false"/>
			    <Label text="突破" autoSize="left" x="1" y="37" style="普通说明" width="115" height="19" var="txt_tupo" mouseEnabled="false"/>
			    <Label autoSize="left" x="1" y="54" style="普通说明" width="104" height="19" var="txt_phase" mouseEnabled="false" text="阶数"/>
			  </Box>
			  <Image skin="png.comp.image" x="27" y="28" width="20" height="20" anchorX=".5" anchorY=".5" var="img_group"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var selectedFlag:CheckBox = null;
      
      public var txt_name:Label = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_tupo:Label = null;
      
      public var txt_phase:Label = null;
      
      public var img_group:Image = null;
      
      public function RecSelectHeroRenderUI()
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
