package game.ui.shenYuans
{
   import morn.customs.components.AlertContent;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS10UI;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class ShenYuanBuyBoxUI extends AlertContent
   {
      
      protected static var uiView:XML = <AlertContent width="300" height="170">
			  <Label text="\l41500138" autoSize="none" x="28" y="53" style="普通说明" size="15" var="txt_tip" width="317" height="20" align="center"/>
			  <Label text="\l41500139 " autoSize="none" x="61" y="99" style="重要提示黄" width="64" height="20" size="15" var="txt_title"/>
			  <Label text="可获得10次,花费" autoSize="none" x="98" y="147" style="重要提示黄" width="122" height="21" size="15" var="txt_get" align="left"/>
			  <WealthRenderS10 x="222" y="145" var="wealth_diamond" runtime="game.ui.commons.icons.WealthRenderS10UI"/>
			  <Label text="(10/20)" autoSize="none" x="284" y="99" style="重要提示绿" var="txt_buyCnt"/>
			  <NumBarS1 x="130" y="97" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Label text="腾讯用户首次8折" autoSize="none" x="109" y="170" style="渐变绿" width="163" height="25" align="center" var="txt_firstBuy" font="Microsoft YaHei" visible="false" wordWrap="true"/>
			</AlertContent>;
       
      
      public var txt_tip:Label = null;
      
      public var txt_title:Label = null;
      
      public var txt_get:Label = null;
      
      public var wealth_diamond:WealthRenderS10UI = null;
      
      public var txt_buyCnt:Label = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public var txt_firstBuy:Label = null;
      
      public function ShenYuanBuyBoxUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS10UI"] = WealthRenderS10UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
