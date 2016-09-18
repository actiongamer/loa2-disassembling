package game.ui.recycleModules.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class RecSelectRebornHeroRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="242" height="100" buttonMode="true">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS2" x="2" y="2"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="15" y="11" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			  <Image skin="png.comp.image" x="18" y="14" var="img_icon" width="54" height="54"/>
			  <Image skin="png.uiRecycle.小框分割线" x="81" y="29"/>
			  <Box x="6" y="12" mouseChildren="false" mouseEnabled="false">
			    <Label text="普罗米修斯" autoSize="left" x="78" style="普通说明" width="140" height="18" var="txt_name" mouseEnabled="false"/>
			    <Label text="等级" autoSize="left" x="79" y="20" style="普通说明" width="75" height="18" var="txt_lvl" mouseEnabled="false"/>
			    <Label text="突破" autoSize="left" x="79" y="38" style="普通说明" width="148" height="19" var="txt_tupo" mouseEnabled="false"/>
			    <Label autoSize="left" x="79" y="57" style="普通说明" width="78" height="19" var="txt_phase" mouseEnabled="false" text="阶数"/>
			    <Label y="61" style="普通说明" width="78" height="19" var="txt_type" mouseEnabled="false" text="阶数" align="center" isHtml="true" x="0"/>
			  </Box>
			  <Button label="选择" x="158" y="70" style="按钮小红" var="btn_select"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_tupo:Label = null;
      
      public var txt_phase:Label = null;
      
      public var txt_type:Label = null;
      
      public var btn_select:Button = null;
      
      public function RecSelectRebornHeroRenderUI()
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
