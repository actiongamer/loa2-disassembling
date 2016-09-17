package game.ui.treasures.runeBag
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.treasures.render.RuneBgListRenderUI;
   
   public class RuneBagViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="558" height="470">
			  <Image skin="jpg.uiTreasure.符文-背景图" width="558" height="470"/>
			  <Image skin="png.uiTreasure.符文-下框底" x="0" y="377" centerX="0"/>
			  <List x="10" y="48" var="list_runeBag" repeatX="8" repeatY="5" spaceX="6" spaceY="6">
			    <RuneBgListRender name="render" runtime="game.ui.treasures.render.RuneBgListRenderUI"/>
			  </List>
			  <PageBarS2 x="211" y="414" var="pagebar" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="\l30600206" y="410" style="按钮大绿" x="419" var="btn_batchCompose" labelMargin="20"/>
			  <Button label="回  收" buttonMode="true" x="91" var="btn_recycle" style="按钮中黄" y="419" labelMargin="20"/>
			  <Image skin="png.uiTreasure2.回收" x="81" y="409" var="img_icon_recycle" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiTreasure.符文文字播报_两端渐变" x="-9" y="10" var="horseLampBg"/>
			  <Image skin="png.uiTreasure.一键合成" x="419" y="411" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiTreasure.遮罩" x="6" y="10" var="img_txtMask" width="543" height="30"/>
			</FadeView>;
       
      
      public var list_runeBag:List = null;
      
      public var pagebar:PageBarS2UI = null;
      
      public var btn_batchCompose:Button = null;
      
      public var btn_recycle:Button = null;
      
      public var img_icon_recycle:Image = null;
      
      public var horseLampBg:Image = null;
      
      public var img_txtMask:Image = null;
      
      public function RuneBagViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.treasures.render.RuneBgListRenderUI"] = RuneBgListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
