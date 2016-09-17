package game.ui.teamPKCS.intros
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class TPKIntro_rigth4UI extends View
   {
      
      protected static var uiView:XML = <View width="504" height="400">
			  <Label text="\l50800119" autoSize="none" y="0" style="普通说明" width="490" height="154" multiline="true" wordWrap="true" var="txt_tip1" leading="5" centerX="0"/>
			  <Label text="\l50800120" autoSize="none" y="304" style="普通说明" width="490" multiline="true" wordWrap="true" var="txt_tip2" leading="5" centerX="0"/>
			  <Box y="154" centerX="0">
			    <Image skin="png.uiTPKIntro.img_txt4"/>
			    <Label text="\l50800123\l \l50800084" autoSize="none" x="39" y="23" style="重要提示黄" multiline="false" wordWrap="false" var="txt_t2" leading="0" width="261" height="20" align="center"/>
			    <Label text="\l50800123\l \l50800085" autoSize="none" x="37" y="64" style="重要提示黄" multiline="false" wordWrap="false" var="txt_t4" leading="0" width="261" height="20" align="center"/>
			    <TPKIntro_timeHBox y="43" var="txt_t3" runtime="game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI"/>
			    <TPKIntro_timeHBox y="83" var="txt_t5" runtime="game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI"/>
			    <Box y="2" var="box_t1">
			      <Label text="\l50800127" autoSize="none" style="小标题" multiline="false" wordWrap="false" var="txt_t1_1" leading="0" width="85" height="20" align="center"/>
			      <Label text="\l50800128" autoSize="none" x="82" style="小标题" multiline="false" wordWrap="false" var="txt_t1_2" leading="0" width="85" height="20" align="center"/>
			      <Label text="\l50800129" autoSize="none" x="160" style="小标题" multiline="false" wordWrap="false" var="txt_t1_3" leading="0" width="85" height="20" align="center"/>
			      <Label text="\l50800130" autoSize="none" x="240" style="小标题" multiline="false" wordWrap="false" var="txt_t1_4" leading="0" width="85" height="20" align="center"/>
			    </Box>
			    <Label text="\l50800086" autoSize="none" x="37" y="104" style="重要提示黄" multiline="false" wordWrap="false" var="txt_t6" leading="0" width="261" height="20" align="center"/>
			    <TPKIntro_timeHBox y="123" var="txt_t7" runtime="game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI"/>
			  </Box>
			</View>;
       
      
      public var txt_tip1:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_t2:Label = null;
      
      public var txt_t4:Label = null;
      
      public var txt_t3:game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI = null;
      
      public var txt_t5:game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI = null;
      
      public var box_t1:Box = null;
      
      public var txt_t1_1:Label = null;
      
      public var txt_t1_2:Label = null;
      
      public var txt_t1_3:Label = null;
      
      public var txt_t1_4:Label = null;
      
      public var txt_t6:Label = null;
      
      public var txt_t7:game.ui.teamPKCS.intros.TPKIntro_timeHBoxUI = null;
      
      public function TPKIntro_rigth4UI()
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
