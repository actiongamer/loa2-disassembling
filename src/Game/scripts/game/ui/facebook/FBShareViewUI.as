package game.ui.facebook
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.btns.BtnFaceBookUI;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class FBShareViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="385" height="265">
			  <PanelBgS3 x="0" y="0" width="385" height="265" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <BtnFaceBook x="132.5" y="217" var="faceBookView" runtime="game.ui.commons.comps.btns.BtnFaceBookUI"/>
			  <Label text="You will receive great rewards for each Friend that game. Your Friends will also receive rewards for joing the game via your invitation!" autoSize="none" x="19" y="51" bold="false" width="346" var="decTxt" height="70" align="left" mouseChildren="false" mouseEnabled="false" style="普通说明" multiline="true" wordWrap="true" indent="16"/>
			  <List x="73" y="127" repeatX="4" spaceX="5" var="rawardList">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			</PopModuleView>;
       
      
      public var faceBookView:BtnFaceBookUI = null;
      
      public var decTxt:Label = null;
      
      public var rawardList:List = null;
      
      public function FBShareViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnFaceBookUI"] = BtnFaceBookUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
