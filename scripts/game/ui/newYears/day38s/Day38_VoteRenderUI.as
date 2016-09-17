package game.ui.newYears.day38s
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class Day38_VoteRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="148" height="220">
			  <Image skin="png.a5.comps.img_block" x="2" y="7" width="143" height="209" var="img_icon"/>
			  <Image skin="png.uiDay38.img_vote_rendre_bg"/>
			  <Label text="普通说明" autoSize="none" x="10" y="161" style="普通说明" width="127" height="20" align="center" var="txt_count"/>
			  <Image skin="png.uiDay38.img_zoom" x="111" y="124" var="img_detail"/>
			  <Button label="按钮" y="187" style="按钮中红" x="33" var="btn_vote"/>
			  <Image skin="png.a5.commonImgs.1ST" x="77" y="10" var="img_rank" anchorX="0.5"/>
			  <Label text="渐变1" autoSize="none" x="28" y="11" style="渐变1" width="104" height="22" align="center" var="txt_rank"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_count:Label = null;
      
      public var img_detail:Image = null;
      
      public var btn_vote:Button = null;
      
      public var img_rank:Image = null;
      
      public var txt_rank:Label = null;
      
      public function Day38_VoteRenderUI()
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
