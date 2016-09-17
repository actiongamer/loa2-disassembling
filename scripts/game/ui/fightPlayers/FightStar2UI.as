package game.ui.fightPlayers
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class FightStar2UI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400" centerX="0" centerY="0">
			  <Box x="204" y="152" var="img_readyCon">
			    <Image skin="png.a5.commonImgs.img_star3" var="img_bg" anchorX=".5" anchorY=".5" x="108" y="47"/>
			    <Image skin="png.a5.commonImgs.img_star1" var="img_ready"/>
			    <Image skin="png.a5.commonImgs.img_star1" x="101" y="45" var="img_readyC" anchorX=".5" anchorY=".5"/>
			  </Box>
			  <Box x="306" y="197" var="img_starCon">
			    <Image skin="png.a5.commonImgs.img_star2" var="img_star" anchorX=".5" anchorY=".5"/>
			    <Image skin="png.a5.commonImgs.img_star2" var="img_starC" anchorX=".5" anchorY=".5" x="1" y="1"/>
			  </Box>
			</View>;
       
      
      public var img_readyCon:Box = null;
      
      public var img_bg:Image = null;
      
      public var img_ready:Image = null;
      
      public var img_readyC:Image = null;
      
      public var img_starCon:Box = null;
      
      public var img_star:Image = null;
      
      public var img_starC:Image = null;
      
      public function FightStar2UI()
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
