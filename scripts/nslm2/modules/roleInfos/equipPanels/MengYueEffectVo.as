package nslm2.modules.roleInfos.equipPanels
{
   import proto.HeroBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class MengYueEffectVo
   {
       
      
      public var heroBaseInfo:HeroBaseInfo;
      
      public var mengYueId:int;
      
      public function MengYueEffectVo()
      {
         super();
      }
      
      public function getHeroColor() : uint
      {
         var _loc1_:* = null;
         if(heroBaseInfo)
         {
            _loc1_ = StcMgr.ins.getNpcVo(heroBaseInfo.baseId);
            return ColorLib.qualityColor(_loc1_.quality);
         }
         return 14210735;
      }
      
      public function getHeroName() : String
      {
         if(heroBaseInfo)
         {
            return HeroInfoUtil.getNameHasTupoLevel(heroBaseInfo.baseId);
         }
         return "";
      }
      
      public function getMengYueName() : String
      {
         if(mengYueId)
         {
            return LocaleMgr.ins.getStr(StcMgr.ins.getMengyueVo(mengYueId).name);
         }
         return "";
      }
      
      public function getMengYueDesc() : String
      {
         if(mengYueId)
         {
            return LocaleMgr.ins.getStr(StcMgr.ins.getMengyueVo(mengYueId).desc);
         }
         return "";
      }
   }
}
