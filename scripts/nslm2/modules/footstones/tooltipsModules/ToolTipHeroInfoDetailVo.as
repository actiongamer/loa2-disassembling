package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import proto.HeroInfo;
   import nslm2.common.model.HeroModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.Uint64Util;
   import proto.PanelBaseInfo;
   
   public class ToolTipHeroInfoDetailVo
   {
       
      
      public var isPlayer:Boolean;
      
      public var isMainHero:Boolean;
      
      public var hasHero:Boolean;
      
      public var roleTeamVo:RoleTeamVo;
      
      public var heroInfo:HeroInfo;
      
      public function ToolTipHeroInfoDetailVo(param1:RoleTeamVo)
      {
         var _loc2_:int = 0;
         super();
         this.roleTeamVo = param1;
         this.isPlayer = false;
         this.hasHero = param1.heroData != null;
         if(this.hasHero == false)
         {
            return;
         }
         var _loc3_:Array = HeroModel.ins.panelBaseInfoList;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(param1.heroData && Uint64Util.equal(param1.heroData.id,(_loc3_[_loc2_] as PanelBaseInfo).id))
            {
               this.isPlayer = true;
               break;
            }
            _loc2_++;
         }
         isMainHero = param1.index == 1;
      }
      
      public function getPlayerCompareVo() : ToolTipHeroInfoDetailVo
      {
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc6_:Array = HeroModel.ins.teamHeroArr;
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(roleTeamVo.heroData.baseId);
         _loc5_ = 0;
         while(_loc5_ < _loc6_.length)
         {
            _loc4_ = _loc6_[_loc5_] as RoleTeamVo;
            if(_loc4_.heroData)
            {
               _loc2_ = StcMgr.ins.getNpcVo(_loc4_.heroData.baseId);
               if(_loc3_.node == _loc2_.node)
               {
                  return new ToolTipHeroInfoDetailVo(_loc4_);
               }
            }
            _loc5_++;
         }
         return new ToolTipHeroInfoDetailVo(_loc6_[0] as RoleTeamVo);
      }
      
      public function getNextVo(param1:int) : ToolTipHeroInfoDetailVo
      {
         var _loc2_:* = null;
         var _loc5_:Array = HeroModel.ins.teamHeroArr;
         var _loc4_:int = roleTeamVo.index - 1;
         var _loc3_:* = _loc4_;
         while(true)
         {
            _loc3_ = int(_loc3_ + param1);
            if(_loc3_ >= _loc5_.length)
            {
               _loc3_ = 0;
            }
            else if(_loc3_ < 0)
            {
               _loc3_ = int(_loc5_.length - 1);
            }
            _loc2_ = _loc5_[_loc3_] as RoleTeamVo;
            if(_loc2_.heroData)
            {
               break;
            }
            if(_loc3_ == _loc4_)
            {
               return this;
            }
         }
         return new ToolTipHeroInfoDetailVo(_loc2_);
      }
   }
}
