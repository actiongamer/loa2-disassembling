package game.ui.fightPlayers
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.customs.components.GCircle;
   
   public class RightHeaderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="400" height="120">
			  <Image skin="png.a5.commonImgs.progressbg2" x="31" y="11"/>
			  <ProgressBar skin="png.a5.commonImgs.progressBar_exp" x="30" y="16" var="progress_hp" value="1"/>
			  <Label text="99999/99999" autoSize="none" x="97" y="21" color="0xebe5d6" width="178" height="18" var="txt_hp" size="12" align="center" visible="false"/>
			  <Image skin="png.a5.commonImgs.img_progressPoint" x="65" y="29" var="img_point" anchorX=".5" anchorY=".5"/>
			  <Image skin="png.a5.commonImgs.progressbg" x="0" y="-1" right="2" top="2"/>
			  <Image skin="png.a5.comps.img_block" x="326" y="9" width="66" height="66" var="img_icon"/>
			  <GCircle fillAlpha="1" lineAlpha="0" x="325" y="9" width="66" height="66" var="img_mask"/>
			  <Label text="label" autoSize="right" x="103" y="43" color="0xebe5d6" width="156" height="24" var="txt_name" size="14" align="right"/>
			  <Label text="Lv.98" autoSize="left" x="262" y="43" color="0xfad455" height="24" var="txt_lv" size="14"/>
			</PlayerRender>;
       
      
      public var progress_hp:ProgressBar = null;
      
      public var txt_hp:Label = null;
      
      public var img_point:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_mask:GCircle = null;
      
      public var txt_name:Label = null;
      
      public var txt_lv:Label = null;
      
      public function RightHeaderUI()
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
