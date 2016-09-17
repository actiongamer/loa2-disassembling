package game.ui.roleTeam.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.ProgressBar;
   
   public class EquipMasterEquipRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="247" height="79" buttonMode="true">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3" sizeGrid="80,40,80,40"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="-5" y="-4" name="selectBox0"/>
			  <Box x="84" y="11" mouseChildren="false" mouseEnabled="false" width="142" height="44">
			    <Label text="普罗米修斯" autoSize="left" style="普通说明" width="142" height="18" var="txt_name" mouseEnabled="false"/>
			  </Box>
			  <Box x="13" y="11">
			    <Box>
			      <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56"/>
			    </Box>
			    <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="50" height="50"/>
			  </Box>
			  <Box x="78" y="48">
			    <ProgressBar skin="png.a5.comps.progresses.progress_S8" y="2" width="146" height="13" sizeGrid="12,0,0,20" var="progressBar" x="0"/>
			    <Label text="1/12212" autoSize="none" x="5.5" color="0xffffff" align="center" width="135" var="txt_progress"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.小框分割线" x="81" y="31"/>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var progressBar:ProgressBar = null;
      
      public var txt_progress:Label = null;
      
      public function EquipMasterEquipRenderUI()
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
