package game.ui.TencentModule.view
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS3UI;
   import game.ui.TencentModule.render.TencentVipLvlUpGiftRenderUI;
   
   public class TencentVipLvlUpGiftViewUI extends View
   {
      
      protected static var uiView:XML = <View width="595" height="465">
			  <List x="6" y="110" repeatY="2" spaceY="5" var="list_reward">
			    <TencentVipLvlUpGiftRender name="render" runtime="game.ui.TencentModule.render.TencentVipLvlUpGiftRenderUI"/>
			  </List>
			  <Image skin="png.uiTencent.分割线" x="16" y="382"/>
			  <Button label="按钮" x="150" y="432" style="按钮大绿" var="btn_get"/>
			  <Button skin="png.a5.comps.img_block" x="330" y="430" var="btn_charge" stateNum="1" width="111" height="34"/>
			  <PageBarS3 x="499" y="150" var="pageBarUi" height="200" runtime="game.ui.commons.comps.pageBars.PageBarS3UI"/>
			</View>;
       
      
      public var list_reward:List = null;
      
      public var btn_get:Button = null;
      
      public var btn_charge:Button = null;
      
      public var pageBarUi:PageBarS3UI = null;
      
      public function TencentVipLvlUpGiftViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.TencentModule.render.TencentVipLvlUpGiftRenderUI"] = TencentVipLvlUpGiftRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS3UI"] = PageBarS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
