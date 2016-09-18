package game.ui.favoriteModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class FavoriteModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="350">
			  <Image skin="png.uiFavorite.背景图" x="75" y="28"/>
			  <Image skin="png.uiFavorite.底" x="74" y="146"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级框" x="59" y="-9" width="548" sizeGrid="72,136,72,53" height="369"/>
			  <Image skin="png.a5.comps.img_block" x="-357" y="-59" width="637" height="475" var="img_block"/>
			  <Button skin="png.uiFavorite.VIP按钮" x="261" y="299" stateNum="1" var="btn_down" label="收藏游戏"/>
			  <List x="160" y="217" repeatX="5" spaceX="12" var="list_reward" centerX="30">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Button skin="png.a5.btns.btn_closeS1" y="-10" stateNum="1" var="btn_close" x="562"/>
			  <Label text="渐变2" autoSize="none" x="105" y="2" style="渐变2" width="454" height="20" align="center" var="txt_title"/>
			  <Image skin="png.uiFavorite.文字4" x="244" y="168"/>
			  <Image skin="png.uiFavorite.文字5" x="200" y="53"/>
			</PopModuleView>;
       
      
      public var img_block:Image = null;
      
      public var btn_down:Button = null;
      
      public var list_reward:List = null;
      
      public var btn_close:Button = null;
      
      public var txt_title:Label = null;
      
      public function FavoriteModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
