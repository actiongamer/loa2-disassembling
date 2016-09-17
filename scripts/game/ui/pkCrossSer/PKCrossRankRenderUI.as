package game.ui.pkCrossSer
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   
   public class PKCrossRankRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="260" height="20">
			  <Label text="名字" autoSize="none" x="42" y="0" style="普通说明" var="txt_name" width="163" height="20"/>
			  <Label text="0" autoSize="none" x="203" y="0" style="普通说明" var="txt_jifen" align="center" width="54" height="20"/>
			  <Label text="1" autoSize="none" x="6" y="0" style="普通说明" var="txt_rank" align="center" width="25" height="20"/>
			  <Label autoSize="none" x="134" y="0" style="普通说明" var="txt_ser" width="63" height="20"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_jifen:Label = null;
      
      public var txt_rank:Label = null;
      
      public var txt_ser:Label = null;
      
      public function PKCrossRankRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
