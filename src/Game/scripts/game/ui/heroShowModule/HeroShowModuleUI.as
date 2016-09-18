package game.ui.heroShowModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Box;
   
   public class HeroShowModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="554">
			  <PanelBg x="0" y="0" width="803" height="554" showTabLine="true"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="16.5" y="75" width="770" height="424" sizeGrid="10,10,10,10"/>
			  <Tab labels="英 雄,碎 片" x="24" y="40" selectedIndex="0" style="TAB长" var="tabBar"/>
			  <List x="28" y="83" repeatX="5" repeatY="2" spaceY="4" var="list_items" spaceX="8">
			    <HeroShowRender name="render" runtime="game.ui.heroShowModule.HeroShowRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="91" y="37" var="img_heroRedPoint"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="169" y="39" var="img_clipRedPoint"/>
			  <PageBarS2 x="324" y="512" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Label text="包裹容量XXX/XXX" autoSize="none" x="36" y="517" style="普通说明" var="txt_volume" visible="false"/>
			  <Box x="572" y="503" lgx="585,572" lgy="503,503" language="en">
			    <Button skin="png.uiHeroShow.11930" x="24" stateNum="1" labelMargin="0,20,0,0" var="btn_preview" scale="0.55"/>
			    <Label text="英雄预览" autoSize="none" y="21" style="普通说明" mouseChildren="false" mouseEnabled="false" align="center" width="85"/>
			  </Box>
			  <Box x="511" y="504">
			    <Button skin="png.uiHeroShow.14000" x="23" stateNum="1" labelMargin="0,20,0,0" var="btn_recommand" scale="0.55"/>
			    <Label text="阵容推荐" autoSize="none" y="21" style="普通说明" mouseChildren="false" mouseEnabled="false" width="80" align="center"/>
			  </Box>
			  <Box x="635" y="500" lgx="655,635" lgy="500,500" language="en" var="recycleBox">
			    <Button skin="png.a5.commonImgs.btn_recycle" x="22.5" stateNum="1" labelMargin="0,15" var="btn_recycle"/>
			    <Label text="\l11300022" autoSize="none" y="24" style="普通说明" mouseChildren="false" mouseEnabled="false" width="80" align="center" x="0"/>
			  </Box>
			  <Box x="697" y="503" language="ru" lgx="702,697,702,702,702,702,702,722" lgy="503,503,503,503,503,503,503,503" var="rebornBox">
			    <Button skin="png.a5.commonImgs.btn_reborn" x="22" stateNum="1" labelMargin="0,15" var="btn_reborn"/>
			    <Label text="\l11300023" autoSize="none" y="21" style="普通说明" mouseChildren="false" mouseEnabled="false" width="80" align="center"/>
			  </Box>
			  <Box x="448" y="504">
			    <Button skin="png.uiHeroShow.40700" x="23" stateNum="1" labelMargin="0,20,0,0" var="btn_shardDonate" scale="0.55"/>
			    <Label text="\l999004011" autoSize="none" y="21" style="普通说明" mouseChildren="false" mouseEnabled="false" width="80" align="center"/>
			  </Box>
			  <Box x="145" y="499" var="box_hero">
			    <Button skin="png.uiHeroShow.援军小" x="30" stateNum="1" labelMargin="0,20,0,0" var="btn_support"/>
			    <Label text="援军养成" autoSize="none" y="28" style="普通说明" mouseChildren="false" mouseEnabled="false" width="100" align="center" var="txt_support" multiline="false" wordWrap="false"/>
			  </Box>
			</PopModuleView>;
       
      
      public var tabBar:Tab = null;
      
      public var list_items:List = null;
      
      public var img_heroRedPoint:Image = null;
      
      public var img_clipRedPoint:Image = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var txt_volume:Label = null;
      
      public var btn_preview:Button = null;
      
      public var btn_recommand:Button = null;
      
      public var recycleBox:Box = null;
      
      public var btn_recycle:Button = null;
      
      public var rebornBox:Box = null;
      
      public var btn_reborn:Button = null;
      
      public var btn_shardDonate:Button = null;
      
      public var box_hero:Box = null;
      
      public var btn_support:Button = null;
      
      public var txt_support:Label = null;
      
      public function HeroShowModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.heroShowModule.HeroShowRenderUI"] = HeroShowRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
