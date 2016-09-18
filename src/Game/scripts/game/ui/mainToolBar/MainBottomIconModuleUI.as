package game.ui.mainToolBar
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class MainBottomIconModuleUI extends View
   {
      
      protected static var uiView:XML = <View width="65" height="75">
			  <BottomIconBar y="0" var="smallBar" runtime="game.ui.mainToolBar.BottomIconBarUI"/>
			  <BottomIconRenderBig x="0" y="0" var="btn_shop" runtime="game.ui.mainToolBar.BottomIconRenderBigUI"/>
			  <BottomIconRenderBig x="65" y="0" var="btn_back" runtime="game.ui.mainToolBar.BottomIconRenderBigUI"/>
			  <ExpBar x="65" y="70" var="expBar" runtime="game.ui.mainToolBar.ExpBarUI"/>
			  <BottomIconBarVertical x="0" var="smallBarVertical" runtime="game.ui.mainToolBar.BottomIconBarVerticalUI"/>
			  <Button buttonMode="true" x="-106" y="32" var="btn_recharge" style="按钮小红" skin="png.uiPlayerHeader_en.btn_recharge"/>
			  <Button buttonMode="true" x="-92" y="-19" var="btnNewFunction" style="按钮小红" skin="png.uiMainToolBar.new"/>
			</View>;
       
      
      public var smallBar:game.ui.mainToolBar.BottomIconBarUI = null;
      
      public var btn_shop:game.ui.mainToolBar.BottomIconRenderBigUI = null;
      
      public var btn_back:game.ui.mainToolBar.BottomIconRenderBigUI = null;
      
      public var expBar:game.ui.mainToolBar.ExpBarUI = null;
      
      public var smallBarVertical:game.ui.mainToolBar.BottomIconBarVerticalUI = null;
      
      public var btn_recharge:Button = null;
      
      public var btnNewFunction:Button = null;
      
      public function MainBottomIconModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.mainToolBar.BottomIconBarUI"] = game.ui.mainToolBar.BottomIconBarUI;
         viewClassMap["game.ui.mainToolBar.BottomIconBarVerticalUI"] = game.ui.mainToolBar.BottomIconBarVerticalUI;
         viewClassMap["game.ui.mainToolBar.BottomIconRenderBigUI"] = game.ui.mainToolBar.BottomIconRenderBigUI;
         viewClassMap["game.ui.mainToolBar.ExpBarUI"] = game.ui.mainToolBar.ExpBarUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
