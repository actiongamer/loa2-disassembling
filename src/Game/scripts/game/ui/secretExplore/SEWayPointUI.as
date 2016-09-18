package game.ui.secretExplore
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class SEWayPointUI extends View
   {
      
      protected static var uiView:XML = <View width="940" height="531">
			  <Image skin="png.comp.image" y="0" var="img_bg1" width="940" height="531" x="0"/>
			  <Image skin="png.uiSecretExplore.img_line0" x="133" y="93" var="img_line_bg" width="668" height="364"/>
			  <Image skin="png.uiSecretExplore.img_bbg" x="200" y="-51"/>
			  <Image skin="png.uiSecretExplore.img_d0" x="230" y="-44" smoothing="true" var="img_l0"/>
			  <Image skin="png.uiSecretExplore.img_d1" x="328" y="-44" smoothing="true" var="img_l1"/>
			  <Image skin="png.uiSecretExplore.img_d2" x="426" y="-44" smoothing="true" var="img_l2"/>
			  <Image skin="png.uiSecretExplore.img_d3" x="524" y="-44" smoothing="true" var="img_l3"/>
			  <Image skin="png.uiSecretExplore.img_ar" x="287" y="-38" smoothing="true" var="img_a0"/>
			  <Button label="按钮" x="586" y="-35" style="按钮中绿" var="btn_next"/>
			  <Image skin="png.uiSecretExplore.img_ar" x="384" y="-38" smoothing="true" var="img_a1"/>
			  <Image skin="png.uiSecretExplore.img_ar" x="481" y="-38" smoothing="true" var="img_a2"/>
			  <SEface x="116" y="241" var="f0" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="240" y="67" var="f1" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="370" y="67" var="f2" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="500" y="67" var="f3" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="630" y="67" var="f4" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="240" y="177" var="f5" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <Image skin="png.uiSecretExplore.img_ba" x="3" y="203"/>
			  <SEface x="370" y="177" var="f6" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="500" y="177" var="f7" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="630" y="177" var="f8" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="238" y="293" var="f9" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="368" y="293" var="f10" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="498" y="293" var="f11" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="628" y="293" var="f12" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="236" y="409" var="f13" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="366" y="409" var="f14" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="496" y="409" var="f15" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <SEface x="626" y="409" var="f16" runtime="game.ui.secretExplore.SEfaceUI"/>
			  <Button skin="png.uiSecretExplore.img_box_close" x="732" y="197" stateNum="1" var="btn_reward"/>
			  <Box x="826" y="172" var="box_tips">
			    <Image skin="png.uiSecretExplore.img_boxTip"/>
			    <Label text="\l50700107" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="150" align="left" y="46" backgroundColor="0xcfbeaf" height="59" x="30" mouseChildren="false" style="普通说明" leading="10" multiline="true" wordWrap="true"/>
			  </Box>
			  <Label text="1" stroke="0xffffff" mouseEnabled="false" var="txt_box_prompt" width="162" align="center" y="323" backgroundColor="0xcfbeaf" height="18" x="722" mouseChildren="false" style="普通说明"/>
			</View>;
       
      
      public var img_bg1:Image = null;
      
      public var img_line_bg:Image = null;
      
      public var img_l0:Image = null;
      
      public var img_l1:Image = null;
      
      public var img_l2:Image = null;
      
      public var img_l3:Image = null;
      
      public var img_a0:Image = null;
      
      public var btn_next:Button = null;
      
      public var img_a1:Image = null;
      
      public var img_a2:Image = null;
      
      public var f0:game.ui.secretExplore.SEfaceUI = null;
      
      public var f1:game.ui.secretExplore.SEfaceUI = null;
      
      public var f2:game.ui.secretExplore.SEfaceUI = null;
      
      public var f3:game.ui.secretExplore.SEfaceUI = null;
      
      public var f4:game.ui.secretExplore.SEfaceUI = null;
      
      public var f5:game.ui.secretExplore.SEfaceUI = null;
      
      public var f6:game.ui.secretExplore.SEfaceUI = null;
      
      public var f7:game.ui.secretExplore.SEfaceUI = null;
      
      public var f8:game.ui.secretExplore.SEfaceUI = null;
      
      public var f9:game.ui.secretExplore.SEfaceUI = null;
      
      public var f10:game.ui.secretExplore.SEfaceUI = null;
      
      public var f11:game.ui.secretExplore.SEfaceUI = null;
      
      public var f12:game.ui.secretExplore.SEfaceUI = null;
      
      public var f13:game.ui.secretExplore.SEfaceUI = null;
      
      public var f14:game.ui.secretExplore.SEfaceUI = null;
      
      public var f15:game.ui.secretExplore.SEfaceUI = null;
      
      public var f16:game.ui.secretExplore.SEfaceUI = null;
      
      public var btn_reward:Button = null;
      
      public var box_tips:Box = null;
      
      public var txt_name:Label = null;
      
      public var txt_box_prompt:Label = null;
      
      public function SEWayPointUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.secretExplore.SEfaceUI"] = game.ui.secretExplore.SEfaceUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
