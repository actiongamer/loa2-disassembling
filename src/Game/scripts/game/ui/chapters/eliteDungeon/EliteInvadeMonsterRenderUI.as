package game.ui.chapters.eliteDungeon
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   
   public class EliteInvadeMonsterRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="102" height="109">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="20" var="img_quality" y="23" sizeGrid="8,8,8,8" width="60" height="60"/>
			  <Box x="-1" y="3" var="box_exceptIconQuality">
			    <Label text="英雄名字六字" x="1" y="85" width="102" height="18" align="center" var="txt_name" style="随品质变化"/>
			    <Image skin="png.a5.comps.img_block" x="24" y="23" width="54" height="54" var="img_icon"/>
			    <Label text="label" width="102" height="18" align="center" var="txt_chapterName" style="普通说明"/>
			    <Image skin="png.a5.commonImgs.img_fighted" x="6" y="26" mouseChildren="false" mouseEnabled="false" var="img_finished"/>
			    <ProgressBar skin="png.a5.comps.progresses.progress_S3" x="14" y="75" sizeGrid="2,0,0,0" var="progressBar"/>
			  </Box>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var box_exceptIconQuality:Box = null;
      
      public var txt_name:Label = null;
      
      public var img_icon:Image = null;
      
      public var txt_chapterName:Label = null;
      
      public var img_finished:Image = null;
      
      public var progressBar:ProgressBar = null;
      
      public function EliteInvadeMonsterRenderUI()
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
