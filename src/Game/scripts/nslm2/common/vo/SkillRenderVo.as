package nslm2.common.vo
{
   import proto.HeroBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import proto.MapKey32Value32;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.modules.cultivates.fashion.FashionModel;
   
   public class SkillRenderVo
   {
       
      
      public var stcSkillId:int;
      
      public var stcNpcId:int;
      
      public var heroBaseInfo:HeroBaseInfo;
      
      public var isHero:Boolean = true;
      
      public function SkillRenderVo(param1:int, param2:int, param3:Boolean = true, param4:HeroBaseInfo = null)
      {
         super();
         stcSkillId = param1;
         stcNpcId = param2;
         isHero = param3;
         heroBaseInfo = param4;
      }
      
      public static function skillArrToActiveVoArr(param1:Array, param2:int, param3:HeroBaseInfo = null) : Array
      {
         var _loc5_:* = null;
         var _loc4_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = param1;
         for each(var _loc6_ in param1)
         {
            _loc5_ = StcMgr.ins.getSkillVo(_loc6_);
            if(_loc5_.show_type != 3)
            {
               _loc4_.push(new SkillRenderVo(_loc6_,param2,true,param3));
            }
         }
         return _loc4_;
      }
      
      public static function skillArrToVoArr(param1:Array, param2:int, param3:Boolean = true, param4:HeroBaseInfo = null) : Array
      {
         var _loc5_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = param1;
         for each(var _loc6_ in param1)
         {
            _loc5_.push(new SkillRenderVo(_loc6_,param2,param3,param4));
         }
         return _loc5_;
      }
      
      public static function skillVoArrToVoArr(param1:Array, param2:int, param3:HeroBaseInfo = null) : Array
      {
         var _loc4_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc5_ in param1)
         {
            _loc4_.push(new SkillRenderVo(_loc5_.id,param2,true,param3));
         }
         return _loc4_;
      }
      
      public function getFashionRandomNum() : int
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         if(heroBaseInfo)
         {
            _loc2_ = heroBaseInfo.fashionSkill;
            _loc1_ = _loc2_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc1_)
            {
               if((_loc2_[_loc5_] as MapKey32Value32).key == stcSkillId)
               {
                  return (_loc2_[_loc5_] as MapKey32Value32).value;
               }
               _loc5_++;
            }
         }
         var _loc4_:StcFashionExtraSkillVo = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",stcSkillId);
         if(_loc4_)
         {
            _loc3_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","skill",_loc4_.id);
            return FashionModel.ins.fashionAccSkillDict.getValue(_loc3_.id);
         }
         return 0;
      }
   }
}
