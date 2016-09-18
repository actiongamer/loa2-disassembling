package nslm2.modules.footstones.tooltipsModules.servers
{
   import proto.PanelBaseInfo;
   import nslm2.modules.cultivates.position.TooltipPositionVo;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.modules.footstones.tooltipsModules.TooltipConfigVo;
   
   public class PanelBaseInfoServer extends TooltipServerBase
   {
       
      
      public function PanelBaseInfoServer(param1:TooltipConfigVo, param2:*)
      {
         super(param1,param2);
      }
      
      public function get panelBaseInfo() : PanelBaseInfo
      {
         if(this.tooltipData is PanelBaseInfo)
         {
            return this.tooltipData;
         }
         return (this.tooltipData as TooltipPositionVo).panelBaseInfo;
      }
      
      override public function exec() : void
      {
         super.exec();
         HeroModel.ins.getHeroInfo(panelBaseInfo.id,getHeroInfoCpl);
      }
      
      private function getHeroInfoCpl(param1:HeroInfo) : void
      {
         this.dataSource = param1;
         this.onComplete();
      }
   }
}
