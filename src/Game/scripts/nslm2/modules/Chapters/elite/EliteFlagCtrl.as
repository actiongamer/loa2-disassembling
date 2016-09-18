package nslm2.modules.Chapters.elite
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Image;
   import nslm2.modules.Chapters.maps.ChapterFlagOnceRender;
   
   public class EliteFlagCtrl implements IDispose
   {
       
      
      private var _titleBlueBg:Image;
      
      public function EliteFlagCtrl(param1:ChapterFlagOnceRender)
      {
         super();
         _titleBlueBg = new Image("png.uiChapter.dungeonMap.img_elite");
         _titleBlueBg.x = -8;
         _titleBlueBg.y = -8;
         param1.txt_dungeonName.addChildAt(_titleBlueBg,0);
      }
      
      public function dispose() : void
      {
      }
   }
}
