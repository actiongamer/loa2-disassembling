package game.ui.resourceDg
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class ResChooseUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <ResCell x="-140" y="103" var="cell0" runtime="game.ui.resourceDg.ResCellUI"/>
			  <ResCell x="25" y="8" var="cell1" runtime="game.ui.resourceDg.ResCellUI"/>
			  <ResCell x="25" y="198" var="cell2" runtime="game.ui.resourceDg.ResCellUI"/>
			  <ResCell x="190" y="103" var="cell3" runtime="game.ui.resourceDg.ResCellUI"/>
			  <ResCell x="355" y="8" var="cell4" runtime="game.ui.resourceDg.ResCellUI"/>
			  <ResCell x="355" y="198" var="cell5" runtime="game.ui.resourceDg.ResCellUI"/>
			  <ResCell x="520" y="103" var="cell6" runtime="game.ui.resourceDg.ResCellUI"/>
			  <Button label="离开" y="489" style="按钮大红" x="260" var="btn_close_2"/>
			  <Image skin="png.uiMainCitys.resDg.img_chosebg" x="104" y="-115"/>
			  <Label autoSize="center" x="88" y="-110" style="普通说明" width="462" height="44" size="24" bold="true" color="0xaf9259" align="center" var="txt_tt"/>
			</View>;
       
      
      public var cell0:game.ui.resourceDg.ResCellUI = null;
      
      public var cell1:game.ui.resourceDg.ResCellUI = null;
      
      public var cell2:game.ui.resourceDg.ResCellUI = null;
      
      public var cell3:game.ui.resourceDg.ResCellUI = null;
      
      public var cell4:game.ui.resourceDg.ResCellUI = null;
      
      public var cell5:game.ui.resourceDg.ResCellUI = null;
      
      public var cell6:game.ui.resourceDg.ResCellUI = null;
      
      public var btn_close_2:Button = null;
      
      public var txt_tt:Label = null;
      
      public function ResChooseUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.resourceDg.ResCellUI"] = game.ui.resourceDg.ResCellUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
