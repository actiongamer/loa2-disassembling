package game.ui.vipModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.customs.components.ClipList;
   
   public class QQChargeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="243" height="171">
			  <Image skin="png.a5.comps.img_block" x="0" y="0" width="243" height="171" var="img_bg"/>
			  <Image skin="png.a5.comps.img_block" x="122.5" y="70" var="img_iconShow" anchorX="0.5" anchorY="0.5"/>
			  <Button label="按钮" skin="png.a5.btns.btn_big_S2" x="55" y="129" style="按钮大蓝" var="btn_buy" stateNum="1" centerX="0"/>
			  <Image skin="png.a5.comps.img_block" x="142" y="2" width="25" height="25" var="img_diamond"/>
			  <ClipList value="10000" clipWidth="14" align="left" url="png.a5.comps.clipList.clipList_S15" x="169" y="4" var="diamond_value"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_iconShow:Image = null;
      
      public var btn_buy:Button = null;
      
      public var img_diamond:Image = null;
      
      public var diamond_value:ClipList = null;
      
      public function QQChargeRenderUI()
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
