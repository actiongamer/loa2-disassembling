package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.CompeteRecordListRenderUI;
   import proto.CompetePlayerRankInfo;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ChampionComepteRecordListRender extends CompeteRecordListRenderUI
   {
       
      
      public function ChampionComepteRecordListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:CompetePlayerRankInfo = param1 as CompetePlayerRankInfo;
         if(_loc4_)
         {
            _loc2_ = "[" + TimeUtils.getShortTimeStr(_loc4_.createTime) + "]";
            txt_content.text = _loc2_ + " " + LocaleMgr.ins.getStr(50400503,[_loc4_.num]);
            if(_loc4_.rank == 1)
            {
               _loc3_ = 50400505;
            }
            if(_loc4_.rank == 2)
            {
               _loc3_ = 50400506;
            }
            if(_loc4_.rank > 2 && _loc4_.rank <= 4)
            {
               _loc3_ = 50400507;
            }
            if(_loc4_.rank > 4 && _loc4_.rank <= 8)
            {
               _loc3_ = 50400508;
            }
            if(_loc4_.rank > 8 && _loc4_.rank <= 16)
            {
               _loc3_ = 50400509;
            }
            if(_loc4_.rank > 16 && _loc4_.rank <= 32)
            {
               _loc3_ = 50400510;
            }
            if(_loc4_.rank > 32)
            {
               _loc3_ = 50400511;
            }
            txt_result.text = LocaleMgr.ins.getStr(50400504) + LocaleMgr.ins.getStr(_loc3_);
         }
      }
   }
}
