package game.ui.roleTeam.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Button;
   
   public class SelectTeamHeroRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="332" height="91">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS2" width="332" height="91" sizeGrid="40,40,40,40"/>
			  <Image skin="png.uiRoleTeam.线条" x="81" y="32" width="225"/>
			  <Label text="防御型" autoSize="left" x="75" y="36" style="普通说明" width="64" height="18" var="txt_type" isHtml="true"/>
			  <Label text="普罗米修斯" autoSize="left" x="76" y="12" style="重要提示橘黄" width="192" height="18" var="txt_name"/>
			  <Box x="14" y="20">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" var="img_quality" sizeGrid="6,6,6,6"/>
			    <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  </Box>
			  <Label text="Lv.51" autoSize="left" x="136" y="36" style="普通说明" width="52" height="18" var="txt_lvl"/>
			  <Label text="可以激活缘分" autoSize="left" x="75" y="56" style="普通绿色" width="182" height="18" var="txt_yuanfen"/>
			  <Button label="上 阵" x="227" style="按钮中绿" y="40" var="btn_select"/>
			  <Label text="Lv.51" autoSize="right" x="169" y="12" style="重要提示橘黄" width="149" height="18" var="txt_group" align="right"/>
			  <Image skin="png.a5.comps.img_block" x="17" y="22" anchorX="0.5" anchorY="0.5" var="img_group" autoSize="false" smoothing="true" mouseEnabled="true" mouseChildren="false" width="20" height="20"/>
			</WealthRender>;
       
      
      public var txt_type:Label = null;
      
      public var txt_name:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_yuanfen:Label = null;
      
      public var btn_select:Button = null;
      
      public var txt_group:Label = null;
      
      public var img_group:Image = null;
      
      public function SelectTeamHeroRenderUI()
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
