package game.ui.npcFuncLists
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.customs.components.GCircle;
   
   public class NpcFuncListPlayerIconUI extends View
   {
      
      protected static var uiView:XML = <View width="97" height="98" scale="1.1">
			  <Image skin="png.uiNpcFuncLists.戒指环底" x="5" y="4"/>
			  <Image skin="png.a5.comps.img_block" x="54" y="53" var="img_icon" autoSize="true" anchorX="0.5" anchorY="0.5" smoothing="true"/>
			  <GCircle fillAlpha="0.5" lineAlpha="0" x="6" y="3" width="98" height="98" var="g_mask"/>
			  <Image skin="png.uiNpcFuncLists.戒指环" x="2" y="2" smoothing="true"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var g_mask:GCircle = null;
      
      public function NpcFuncListPlayerIconUI()
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
