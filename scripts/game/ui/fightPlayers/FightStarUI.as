package game.ui.fightPlayers
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   import morn.core.components.Image;
   
   public class FightStarUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400" centerX="0" centerY="0">
			  <Box x="-402" y="96" centerX="0" centerY="0">
			    <Box x="522" y="60" var="img_right">
			      <Image skin="png.uiAreanStart.img_jjc2"/>
			      <Label text="人名1" autoSize="none" x="226" y="54" style="渐变1" width="181" height="30" align="center" var="txt_name_r"/>
			      <Label text="战力：" autoSize="none" x="246" y="86" style="渐变1" width="53" height="22" align="center"/>
			      <ClipList value="111444" clipWidth="14" align="left" url="png.a5.comps.clipList.clipList_S15" x="299" y="88" gapX="-1" var="txt_fightValue_r"/>
			    </Box>
			    <Box var="img_left">
			      <Image skin="png.uiAreanStart.img_jjc3" x="0" y="0"/>
			      <Label text="人名1" autoSize="none" x="317" y="76" style="渐变1" width="181" height="30" align="center" var="txt_name_l"/>
			      <Label text="战力：" autoSize="none" x="337" y="112" style="渐变1" width="53" height="22" align="center"/>
			      <ClipList value="111444" clipWidth="14" align="left" url="png.a5.comps.clipList.clipList_S15" x="390" y="114" gapX="-1" var="txt_fightValue_l"/>
			    </Box>
			    <Image skin="png.uiAreanStart.img_jjc1" x="542" y="59" var="img_middle"/>
			  </Box>
			</View>;
       
      
      public var img_right:Box = null;
      
      public var txt_name_r:Label = null;
      
      public var txt_fightValue_r:ClipList = null;
      
      public var img_left:Box = null;
      
      public var txt_name_l:Label = null;
      
      public var txt_fightValue_l:ClipList = null;
      
      public var img_middle:Image = null;
      
      public function FightStarUI()
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
