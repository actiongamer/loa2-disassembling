package nslm2.inits.regRuntimes
{
   import morn.core.components.View;
   import game.ui.chapters.eliteDungeon.EliteInvadeRenderUI;
   import nslm2.modules.Chapters.elite.EliteInvadeRender;
   import game.ui.chapters.eliteDungeon.EliteInvadeMonsterRenderUI;
   import nslm2.modules.Chapters.elite.EliteInvadeMonsterRender;
   import game.ui.chapters.StarRenderUI;
   import nslm2.modules.Chapters.StarRender;
   import game.ui.chapters.maps.MapArrowUI;
   import nslm2.modules.Chapters.maps.MapArrow;
   import game.ui.chapters.ChapterMapUI;
   import nslm2.modules.Chapters.maps.ChapterMap;
   import game.ui.chapters.reset.DungeonResetUI;
   import nslm2.modules.Chapters.reset.DungeonReset;
   import game.ui.chapters.DungeonListTopRenderUI;
   import nslm2.modules.Chapters.DungeonListTopRender;
   import game.ui.chapters.video.VideoInfoRenderUI;
   import nslm2.modules.Chapters.video.VideoInfoRender;
   import game.ui.chapters.saodang.SaoDangRenderUI;
   import nslm2.modules.Chapters.saodang.SaoDangMainRender;
   import game.ui.chapters.DungeonFlagRenderUI;
   import nslm2.modules.Chapters.maps.ChapterFlagOnceRender;
   import game.ui.chapters.ChapterRenderUI;
   import nslm2.modules.Chapters.maps.ChapterRender;
   import game.ui.chapters.DungeonInfoRewardRenderUI;
   import nslm2.modules.Chapters.DungeonInfoRewardRender;
   
   public class RegRuntime_Chapter
   {
       
      
      public function RegRuntime_Chapter()
      {
         super();
         View.runtimeClassMap[EliteInvadeRenderUI] = EliteInvadeRender;
         View.runtimeClassMap[EliteInvadeMonsterRenderUI] = EliteInvadeMonsterRender;
         View.runtimeClassMap[StarRenderUI] = StarRender;
         View.runtimeClassMap[MapArrowUI] = MapArrow;
         View.runtimeClassMap[ChapterMapUI] = ChapterMap;
         View.runtimeClassMap[DungeonResetUI] = DungeonReset;
         View.runtimeClassMap[DungeonListTopRenderUI] = DungeonListTopRender;
         View.runtimeClassMap[VideoInfoRenderUI] = VideoInfoRender;
         View.runtimeClassMap[SaoDangRenderUI] = SaoDangMainRender;
         View.runtimeClassMap[DungeonFlagRenderUI] = ChapterFlagOnceRender;
         View.runtimeClassMap[ChapterRenderUI] = ChapterRender;
         View.runtimeClassMap[DungeonInfoRewardRenderUI] = DungeonInfoRewardRender;
      }
   }
}
