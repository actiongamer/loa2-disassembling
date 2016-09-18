package game.ui.heroAwakenRoad
{
   import morn.customs.components.AlertContent;
   import morn.core.components.Label;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class BuyFightCountUI extends AlertContent
   {
      
      protected static var uiView:XML = <AlertContent width="300" height="170">
			  <Label text="\l30121011" autoSize="none" x="-13" y="53" style="普通说明" size="15" var="txt_tip" align="center" width="400" height="20"/>
			  <Label text="\l30121013 " autoSize="none" x="61" y="95" style="重要提示黄" width="64" height="20" size="15"/>
			  <Label text="可获得10点精力,花费" autoSize="none" x="-13" y="153" style="重要提示黄" width="400" height="21" size="15" var="txt_get" align="center"/>
			  <Label text="(10/20)" autoSize="none" x="284" y="95" style="重要提示绿" var="txt_buyCnt"/>
			  <NumBarS1 x="130" y="93" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Label text="\l30121011" autoSize="none" x="-13" y="125" style="普通说明" size="15" var="txt_vip" align="center" width="400" height="20"/>
			</AlertContent>;
       
      
      public var txt_tip:Label = null;
      
      public var txt_get:Label = null;
      
      public var txt_buyCnt:Label = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public var txt_vip:Label = null;
      
      public function BuyFightCountUI()
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
