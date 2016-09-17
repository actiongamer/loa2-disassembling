package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class CompePlayerShowViewUI extends View
   {
      
      protected static var uiView:XML = <View width="206" height="274">
			  <PlayerListRender x="34" y="62" var="nameRender" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			  <Box x="12" y="111" var="box_empty">
			    <Image skin="png.uiChampionship.人物剪影-小" smoothing="true" width="194" height="163"/>
			    <Label text="A组\n冠军" autoSize="none" x="-2" y="54" style="随品质变化" width="180" height="49" align="center" var="txt_title"/>
			  </Box>
			</View>;
       
      
      public var nameRender:game.ui.championship.comp.PlayerListRenderUI = null;
      
      public var box_empty:Box = null;
      
      public var txt_title:Label = null;
      
      public function CompePlayerShowViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.PlayerListRenderUI"] = game.ui.championship.comp.PlayerListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
