package nslm2.modules.roleInfos
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import proto.PanelBaseInfo;
   import proto.HeroBaseInfo;
   import proto.HeroInfo;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.HeroModel;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.FightProp;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroShengjieVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.vo.SkillRenderVo;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import nslm2.modules.roleInfos.tupos.RoleTupoUtil;
   
   public class HeroInfoUtil
   {
       
      
      public function HeroInfoUtil()
      {
         super();
      }
      
      public static function getSex(param1:int) : int
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc2_)
         {
            return _loc2_.sex;
         }
         new StcLackFatal(StcNpcVo,"static_npc",param1);
         return 0;
      }
      
      public static function getModel3D(param1:uint) : StcModelVo
      {
         if(StcMgr.ins.getNpcVo(param1))
         {
            return StcMgr.ins.getModelVo(int(StcMgr.ins.getNpcVo(param1).model_id));
         }
         new StcLackFatal(HeroInfoUtil,"static_npc",param1);
         return null;
      }
      
      public static function heroBaseInfoToPanelBaseInfo(param1:HeroBaseInfo) : PanelBaseInfo
      {
         var _loc2_:PanelBaseInfo = new PanelBaseInfo();
         _loc2_.id = param1.id;
         _loc2_.ability = param1.fightValue;
         _loc2_.baseId = param1.baseId;
         _loc2_.level = param1.level;
         _loc2_.shengjie = param1.sjLevel;
         _loc2_.place = param1.place;
         _loc2_.position = param1.position;
         _loc2_.mengyue = param1.mengyue;
         _loc2_.tupoItem = param1.tupoItem;
         return _loc2_;
      }
      
      public static function heroInfoToPanelBaseinfo(param1:HeroInfo) : PanelBaseInfo
      {
         var _loc2_:PanelBaseInfo = new PanelBaseInfo();
         _loc2_.id = param1.baseInfo.id;
         _loc2_.ability = param1.baseInfo.fightValue;
         _loc2_.baseId = param1.baseInfo.baseId;
         _loc2_.level = param1.baseInfo.level;
         _loc2_.shengjie = param1.baseInfo.sjLevel;
         _loc2_.place = param1.baseInfo.place;
         _loc2_.position = param1.baseInfo.position;
         _loc2_.mengyue = param1.baseInfo.mengyue;
         _loc2_.tupoItem = param1.baseInfo.tupoItem;
         _loc2_.shengridinfo = param1.shengridinfo;
         return _loc2_;
      }
      
      public static function isPlayerHero(param1:UInt64) : Boolean
      {
         return Uint64Util.equal(param1,HeroModel.ins.playerHero.baseInfo.id);
      }
      
      public static function isPlayerHeroByBaseId(param1:uint) : Boolean
      {
         if(EnvConfig.ins.useServer == false)
         {
            return false;
         }
         var _loc3_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(HeroModel.ins.playerHero.baseInfo.baseId);
         return _loc3_.node == _loc2_.node;
      }
      
      public static function getName(param1:UInt64, param2:uint, param3:Boolean = false) : String
      {
         var _loc4_:* = null;
         if(param1 != null && Uint64Util.equal(param1,HeroModel.ins.playerHero.baseInfo.id))
         {
            if(param3)
            {
               return "";
            }
            return PlayerModel.ins.playerInfo.name;
         }
         _loc4_ = StcMgr.ins.getNpcVo(param2);
         if(_loc4_)
         {
            if(param3)
            {
               return LocaleMgr.ins.getStr(int(_loc4_.node + 999800000));
            }
            return LocaleMgr.ins.getStr(int(_loc4_.name));
         }
         new StcLackFatal(HeroInfoUtil,"static_npc",param2);
         return "";
      }
      
      public static function getNameHasTupoLevel(param1:uint, param2:Boolean = false) : String
      {
         var _loc4_:* = null;
         var _loc3_:String = "";
         if(isPlayerHeroByBaseId(param1))
         {
            _loc3_ = _loc3_ + PlayerModel.ins.playerInfo.name;
         }
         else
         {
            _loc4_ = StcMgr.ins.getNpcVo(param1);
            if(_loc4_)
            {
               if(param2)
               {
                  _loc3_ = _loc3_ + LocaleMgr.ins.getStr(int(_loc4_.node + 999800000));
               }
               else
               {
                  _loc3_ = _loc3_ + LocaleMgr.ins.getStr(int(_loc4_.name));
               }
            }
            else
            {
               new StcLackFatal(HeroInfoUtil,"static_npc",param1);
               _loc3_ = _loc3_ + "";
            }
         }
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc5_)
         {
            if(_loc5_.tupo > 0)
            {
               _loc3_ = _loc3_ + (" +" + _loc5_.tupo);
            }
         }
         return _loc3_;
      }
      
      public static function getHtmlNameHasTupoLevel(param1:int, param2:Boolean = false, param3:Boolean = true) : String
      {
         var _loc5_:* = null;
         var _loc4_:String = "";
         if(isPlayerHeroByBaseId(param1))
         {
            if(param2)
            {
               return "";
            }
            _loc4_ = _loc4_ + PlayerModel.ins.playerInfo.name;
         }
         else
         {
            _loc5_ = StcMgr.ins.getNpcVo(param1);
            if(_loc5_)
            {
               if(param2)
               {
                  _loc4_ = _loc4_ + LocaleMgr.ins.getStr(int(_loc5_.node + 999800000));
               }
               else
               {
                  _loc4_ = _loc4_ + LocaleMgr.ins.getStr(int(_loc5_.name));
               }
            }
            else
            {
               new StcLackFatal(HeroInfoUtil,"static_npc",param1);
               _loc4_ = _loc4_ + "";
            }
         }
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc6_ && param3)
         {
            if(_loc6_.tupo > 0)
            {
               _loc4_ = _loc4_ + (" +" + _loc6_.tupo);
            }
         }
         if(isPlayerHeroByBaseId(param1))
         {
            _loc4_ = TextFieldUtil.htmlText2(_loc4_,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank)));
         }
         else
         {
            _loc4_ = TextFieldUtil.htmlText2(_loc4_,ColorLib.qualityColor(_loc6_.quality));
         }
         return _loc4_;
      }
      
      public static function getTupoClipArr(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = (param1 - 1) / 3;
         var _loc4_:int = (param1 - 1) % 3;
         return ArrayUtil.fillBySameItem(_loc2_,_loc4_ + 1,_loc3_);
      }
      
      public static function getCareerName(param1:UInt64, param2:uint) : String
      {
         if(Uint64Util.equal(param1,HeroModel.ins.playerHero.baseInfo.id))
         {
            return "";
         }
         if(StcMgr.ins.getNpcVo(param2))
         {
            return LocaleMgr.ins.getStr(5000 + StcMgr.ins.getNpcVo(param2).career_id);
         }
         new StcLackFatal(HeroInfoUtil,"static_npc",param2);
         return "";
      }
      
      public static function getQuality(param1:uint) : int
      {
         return StcMgr.ins.getNpcVo(param1).quality;
      }
      
      public static function getHeadIconUrlByHeroBaseInfo(param1:HeroBaseInfo) : String
      {
         return getHeadIconUrl(param1.id,param1.baseId);
      }
      
      public static function getHeadIconUrl(param1:UInt64, param2:uint) : String
      {
         var _loc3_:* = null;
         if(false && param1 != null && Uint64Util.equal(param1,HeroModel.ins.playerHero.baseInfo.id))
         {
            _loc3_ = "0";
         }
         else if(StcMgr.ins.getNpcVo(param2))
         {
            _loc3_ = StcMgr.ins.getNpcVo(param2).head_id;
         }
         else
         {
            new StcLackFatal(HeroInfoUtil,"static_npc",param2);
            _loc3_ = "0";
         }
         return UrlLib.headIcon(_loc3_);
      }
      
      public static function toBasePropList(param1:FightProp) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = NPCPropConsts.ins.baseProp5List.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = NPCPropConsts.ins.baseProp5List[_loc5_];
            _loc2_.push(new NpcPropVo(_loc3_,int(param1[NPCPropConsts.ins.getProtobufPropertyName(_loc3_)])));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function toFightPropList(param1:FightProp) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = NPCPropConsts.ins.fightPropList.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = NPCPropConsts.ins.fightPropList[_loc5_];
            _loc2_.push(new NpcPropVo(_loc3_,int(param1[NPCPropConsts.ins.getProtobufPropertyName(_loc3_)])));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function toFightPercentPropList(param1:FightProp) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = NPCPropConsts.ins.fightPropList.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = NPCPropConsts.ins.fightPropPercentList[_loc5_];
            _loc2_.push(new NpcPropVo(_loc3_,param1[NPCPropConsts.ins.getProtobufPropertyName(_loc3_)]));
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function getNodeId(param1:uint) : uint
      {
         if(StcMgr.ins.getNpcVo(param1))
         {
            return StcMgr.ins.getNpcVo(param1).node;
         }
         new StcLackFatal(HeroInfoUtil,"static_npc",param1);
         return 0;
      }
      
      public static function isMaxExp(param1:HeroBaseInfo) : Boolean
      {
         var _loc3_:StcLevelVo = getLevelVo(param1,param1.level);
         var _loc2_:StcLevelVo = getLevelVo(param1,param1.level + 1);
         if(Uint64Util.toNumber(param1.exp) >= _loc3_.exp - 1 && (param1.level >= PlayerModel.ins.level || _loc2_ == null))
         {
            return true;
         }
         return false;
      }
      
      public static function getLevelVo(param1:HeroBaseInfo, param2:uint) : StcLevelVo
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         if(HeroInfoUtil.isPlayerHero(param1.id))
         {
            _loc3_ = 1;
         }
         else
         {
            _loc3_ = 2;
         }
         switch(int(_loc3_) - 1)
         {
            case 0:
               _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_level",["kind","level"],[_loc3_,param2]);
               break;
            case 1:
               _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_level",["kind","level","quality"],[_loc3_,param2,StcMgr.ins.getNpcVo(param1.baseId).quality]);
         }
         return _loc4_;
      }
      
      public static function createFakeHeroInfoByNpcVo(param1:StcNpcVo) : HeroInfo
      {
         var _loc2_:HeroInfo = new HeroInfo();
         _loc2_.baseInfo = new HeroBaseInfo();
         _loc2_.baseInfo.id = Uint64Util.fromNumber(0);
         _loc2_.baseInfo.level = 1;
         _loc2_.baseInfo.baseId = param1.id;
         _loc2_.baseInfo.fightValue = Uint64Util.fromNumber(param1.combat_power);
         _loc2_.baseInfo.skill = param1.skillIdArr;
         _loc2_.baseInfo.sjExp = Uint64Util.fromNumber(0);
         _loc2_.prop = NpcPropVo.fightPropFromNpcVo(param1);
         return _loc2_;
      }
      
      public static function getHeroAllSkillIdArr(param1:HeroBaseInfo) : Array
      {
         var _loc9_:* = 0;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc8_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseId);
         var _loc2_:StcHeroShengjieVo = StcMgr.ins.getVoByMultiColumnValue("static_hero_shengjie",["kind","level"],[1,param1.sjLevel]) as StcHeroShengjieVo;
         var _loc6_:Array = ArrayUtil.removeAllItemEqualValue(param1.skill,0);
         var _loc3_:int = !!_loc6_?_loc6_.length:0;
         var _loc4_:Array = !!_loc6_?_loc6_:[];
         _loc9_ = _loc3_;
         while(_loc9_ < _loc8_.skillIdArr.length)
         {
            _loc7_ = StcMgr.ins.getSkillVo(_loc8_.skillIdArr[_loc9_]);
            if(_loc7_)
            {
               if(_loc7_.show_type == 3)
               {
                  _loc4_.push(_loc7_.id);
               }
               else
               {
                  _loc5_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[_loc8_.skillIdArr[_loc9_],_loc2_.skill_level]);
                  if(_loc5_)
                  {
                     _loc4_.push(_loc5_.id);
                  }
                  else
                  {
                     _loc4_.push(_loc8_.skillIdArr[_loc9_]);
                  }
               }
            }
            _loc9_++;
         }
         return _loc4_;
      }
      
      public static function getHeroAllSkillVoArr(param1:HeroBaseInfo) : Array
      {
         var _loc2_:Array = getHeroAllSkillIdArr(param1);
         return SkillRenderVo.skillArrToVoArr(_loc2_,param1.baseId,true,param1);
      }
      
      public static function getHeroActiveSkillVoArr(param1:HeroBaseInfo) : Array
      {
         var _loc2_:Array = getHeroAllSkillIdArr(param1);
         return SkillRenderVo.skillArrToActiveVoArr(_loc2_,param1.baseId);
      }
      
      public static function hasUnlockedSkill(param1:int, param2:int) : Boolean
      {
         var _loc4_:StcTupoVo = StcMgr.ins.getTupoVo(param2);
         var _loc6_:StcNpcVo = StcMgr.ins.getNpcVo(param2);
         var _loc3_:Array = [_loc6_.skill_id1,_loc6_.skill_id2,_loc6_.skill_id3,_loc6_.skill_id4];
         var _loc5_:int = StcMgr.ins.getSkillVo(param1).node_id;
         if(!_loc4_)
         {
            return false;
         }
         if(_loc3_.indexOf(_loc5_) == -1 || _loc3_.indexOf(_loc5_) + 1 <= _loc4_.skill_count)
         {
            return true;
         }
         return false;
      }
      
      public static function getSkillUnlockTupoLevel(param1:int, param2:int) : int
      {
         var _loc4_:StcTupoVo = StcMgr.ins.getTupoVo(param2);
         if(!_loc4_)
         {
            return 0;
         }
         var _loc5_:int = _loc4_.tupo_level;
         var _loc3_:StcTupoVo = RoleTupoUtil.getStcTupoVo(_loc4_.hero_node,_loc5_ + 1);
         while(_loc3_)
         {
            if(RoleTupoUtil.getUnlockSkillId(_loc3_.id) == StcMgr.ins.getSkillVo(param1).node_id)
            {
               return _loc3_.tupo_level;
            }
            _loc5_++;
            _loc3_ = RoleTupoUtil.getStcTupoVo(_loc4_.hero_node,_loc5_ + 1);
         }
         return 0;
      }
      
      public static function getSkillUnlockTupoStr(param1:int, param2:int) : String
      {
         var _loc3_:int = getSkillUnlockTupoLevel(param1,param2);
         if(_loc3_ != 0)
         {
            return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(30110901,[_loc3_]),16723968);
         }
         return "";
      }
      
      public static function getTupoDesc(param1:String, param2:Boolean = true) : String
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         param1 = param1.split("|")[0] as String;
         var _loc5_:Array = param1.split(":");
         var _loc7_:int = _loc5_[0];
         var _loc6_:Number = Math.abs(Number(_loc5_[1]));
         if(_loc7_ == 3 || _loc7_ == 4)
         {
            _loc3_ = 2016;
         }
         else if(_loc7_ == 20)
         {
            _loc3_ = 41300102;
         }
         else if(_loc7_ == 21)
         {
            _loc3_ = 300005;
         }
         else if(_loc7_ == 22)
         {
            _loc3_ = 300006;
         }
         else
         {
            _loc3_ = _loc7_ + 2000;
         }
         if(param2)
         {
            _loc4_ = uint(NpcPropVo.getValueColorByPropId(_loc7_));
            return LocaleMgr.ins.getStr(_loc3_.toString()) + ":" + TextFieldUtil.htmlText2("+" + (_loc6_ > 1?_loc6_:int(_loc6_ * 100) + "%"),_loc4_);
         }
         return LocaleMgr.ins.getStr(_loc3_.toString()) + ":+" + (_loc6_ > 1?_loc6_:int(_loc6_ * 100) + "%");
      }
      
      public static function getNpcQualityName(param1:int) : String
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc2_)
         {
            return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc2_.name),ColorLib.qualityColor(_loc2_.quality));
         }
         return "";
      }
   }
}
