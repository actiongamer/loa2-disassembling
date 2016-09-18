package game.ui.teamGuajiScenes.mains
{
   import morn.customs.components.AlertContent;
   import morn.core.components.Label;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class BuyRobCountUI extends AlertContent
   {
      
      protected static var uiView:XML = <AlertContent width="300" height="170">
			  <Label text="选择购买精力的数量" autoSize="none" x="38" y="44" style="普通说明" size="15" var="txt_tip" width="294" height="51" align="center" wordWrap="true" multiline="true"/>
			  <Label text="购买份数" autoSize="none" x="71" y="109" style="重要提示黄" width="64" height="20" size="15"/>
			  <Label text="可获得10点精力,花费" autoSize="none" x="-65" y="157" style="重要提示黄" width="495" height="21" size="15" var="txt_get" align="center"/>
			  <Label text="(10/20)" autoSize="none" x="294" y="109" style="重要提示绿" var="txt_buyCnt"/>
			  <NumBarS1 x="140" y="107" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			</AlertContent>;
       
      
      public var txt_tip:Label = null;
      
      public var txt_get:Label = null;
      
      public var txt_buyCnt:Label = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public function BuyRobCountUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
