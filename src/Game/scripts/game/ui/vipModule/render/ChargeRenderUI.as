package game.ui.vipModule.render
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.customs.components.ClipList;
   
   public class ChargeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="243" height="171">
			  <Image skin="png.uiVip.宝箱底部" x="0" y="0"/>
			  <Image skin="png.uiVip.钻石箱（临时）" x="77.5" y="31"/>
			  <Button label="按钮" skin="png.a5.btns.btn_big_S2" x="55" y="129" style="按钮大蓝" var="btn_buy" stateNum="1" centerX="0"/>
			  <Label text="普通说明" autoSize="none" x="0" y="109" style="普通说明" width="243" align="center" var="txt_desc"/>
			  <Image skin="png.a5.comps.img_block" x="142" y="2" width="25" height="25" var="img_diamond"/>
			  <ClipList value="10000" clipWidth="14" align="left" url="png.a5.comps.clipList.clipList_S15" x="169" y="4" var="diamond_value"/>
			</View>;
       
      
      public var btn_buy:Button = null;
      
      public var txt_desc:Label = null;
      
      public var img_diamond:Image = null;
      
      public var diamond_value:ClipList = null;
      
      public function ChargeRenderUI()
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
