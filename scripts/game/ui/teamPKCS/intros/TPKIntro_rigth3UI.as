package game.ui.teamPKCS.intros
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class TPKIntro_rigth3UI extends View
   {
      
      protected static var uiView:XML = <View width="504" height="384">
			  <Label text="\l50800117" autoSize="none" y="0" style="普通说明" width="490" multiline="true" wordWrap="true" var="txt_tip1" leading="0" centerX="0" x="7" height="126"/>
			  <Box y="125" centerX="0">
			    <Image skin="png.uiTPKIntro.img_txt3"/>
			    <Label text="\l50800123\l \l50800082" autoSize="none" x="42" y="24" style="重要提示黄" multiline="false" wordWrap="false" var="txt_t2" leading="0" width="261" height="20" align="center"/>
			    <Label text="\l50800123\l \l50800083" autoSize="none" x="40" y="65" style="重要提示黄" multiline="false" wordWrap="false" var="txt_t4" leading="0" width="261" height="20" align="center"/>
			    <TPKIntro_timeHBox x="3" y="44" var="txt_t3" runtime="game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI"/>
			    <TPKIntro_timeHBox x="3" y="84" var="txt_t5" runtime="game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI"/>
			    <Box x="3" y="3" var="box_t1">
			      <Label text="\l50800127" autoSize="none" style="小标题" multiline="false" wordWrap="false" var="txt_t1_1" leading="0" width="85" height="20" align="center"/>
			      <Label text="\l50800128" autoSize="none" x="82" style="小标题" multiline="false" wordWrap="false" var="txt_t1_2" leading="0" width="85" height="20" align="center"/>
			      <Label text="\l50800129" autoSize="none" x="160" style="小标题" multiline="false" wordWrap="false" var="txt_t1_3" leading="0" width="85" height="20" align="center"/>
			      <Label text="\l50800130" autoSize="none" x="240" style="小标题" multiline="false" wordWrap="false" var="txt_t1_4" leading="0" width="85" height="20" align="center"/>
			    </Box>
			  </Box>
			  <Box y="202" centerX="0" x="84.5" width="335" height="176">
			    <Image skin="png.uiTPKIntro.img_txt2" sizeGrid="10,40,10,10" width="504" height="190" x="-84" y="0"/>
			    <Label text="\l50800118" autoSize="none" y="61" style="普通说明" width="490" multiline="true" wordWrap="true" var="txt_tip2" leading="0" centerX="0"/>
			    <Label text="\l50800126" autoSize="none" y="39" style="渐变1" width="323" multiline="false" wordWrap="false" var="txt_title1" leading="0" align="center" height="20" size="14"/>
			  </Box>
			</View>;
       
      
      public var txt_tip1:Label = null;
      
      public var txt_t2:Label = null;
      
      public var txt_t4:Label = null;
      
      public var txt_t3:game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI = null;
      
      public var txt_t5:game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI = null;
      
      public var box_t1:Box = null;
      
      public var txt_t1_1:Label = null;
      
      public var txt_t1_2:Label = null;
      
      public var txt_t1_3:Label = null;
      
      public var txt_t1_4:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_title1:Label = null;
      
      public function TPKIntro_rigth3UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI"] = game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
