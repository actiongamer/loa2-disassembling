package nslm2.modules.footstones.localeModules
{
   import com.mz.core.interFace.ILocaleMgr;
   import org.specter3d.utils.HashMap;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcLanguageVo;
   import morn.core.utils.StringUtils;
   import com.mz.core.logging.Log;
   import org.specter3d.utils.StringUtil;
   import com.mz.core.utils.DictHash;
   import flash.utils.Dictionary;
   import morn.core.utils.NumberUtil;
   import proto.PlayerBaseInfo;
   import nslm2.utils.LabelMed;
   import nslm2.modules.foundations.vip.consts.VipUtils;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import proto.Item;
   
   public class LocaleMgr implements ILocaleMgr
   {
      
      private static var _ins:nslm2.modules.footstones.localeModules.LocaleMgr;
      
      public static var reg:RegExp = new RegExp(/@{.*?}/g);
      
      public static var mornUILanguageMap:HashMap = new HashMap();
       
      
      public function LocaleMgr()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.footstones.localeModules.LocaleMgr
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.localeModules.LocaleMgr();
         }
         return _ins;
      }
      
      public function hasStr(param1:*) : Boolean
      {
         var _loc2_:StcLanguageVo = StcMgr.ins.getLanguageVo(int(param1));
         return _loc2_ != null;
      }
      
      public function getStr(param1:*, param2:Array = null) : String
      {
         var _loc3_:* = null;
         var _loc4_:StcLanguageVo = StcMgr.ins.getLanguageVo(int(param1));
         if(_loc4_ != null)
         {
            if(StringUtils.isNull(_loc4_.text))
            {
               return "";
            }
            _loc3_ = strParams(_loc4_.text,param2);
            if(param2)
            {
               _loc3_ = parseParamAdvance(_loc3_,param2);
            }
            if(_loc3_ == null)
            {
               _loc3_ = "语言包错误:" + param1 + " " + _loc4_.text + " " + param2;
               Log.error(this,_loc3_);
               return _loc3_;
            }
            _loc3_ = _loc3_.replace(/\\n/g,"\n");
            if(_loc3_.indexOf("{#123}") >= 0)
            {
               _loc3_ = StringUtil.replaceAll1(_loc3_,"{#123}"," ");
            }
            return _loc3_;
         }
         if(param1 == 1)
         {
            return "";
         }
         return "language:" + strParams(param1,param2);
      }
      
      public function getIDByStr(param1:String) : int
      {
         var _loc2_:* = null;
         var _loc4_:DictHash = StcMgr.ins.getTabel("static_language");
         var _loc3_:Dictionary = _loc4_.dict;
         var _loc7_:int = 0;
         var _loc6_:* = _loc3_;
         for(var _loc5_ in _loc3_)
         {
            _loc2_ = _loc3_[_loc5_] as StcLanguageVo;
            if(param1 == _loc2_.text)
            {
               return _loc2_.id;
            }
         }
         return -1;
      }
      
      public function parseText(param1:String) : String
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         if(mornUILanguageMap.containsKey(param1))
         {
            _loc3_ = String(mornUILanguageMap.getValue(param1));
            if(_loc3_.slice(0,2) == "\\$")
            {
               param1 = _loc3_.slice(2,_loc3_.length);
            }
            else
            {
               param1 = _loc3_;
            }
         }
         var _loc7_:Array = param1.split("\\l");
         var _loc5_:int = _loc7_.length;
         if(_loc5_ > 1)
         {
            _loc2_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc4_ = _loc7_[_loc6_];
               if(NumberUtil.isOdd(_loc6_))
               {
                  _loc2_.push(this.getStr(_loc4_));
               }
               else
               {
                  _loc2_.push(_loc4_);
               }
               _loc6_++;
            }
            return _loc2_.join("");
         }
         return param1;
      }
      
      public function strParams(param1:String, param2:Array) : String
      {
         var _loc3_:int = 0;
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               param1 = param1.replace("@param" + _loc3_.toString(),param2[_loc3_]);
               _loc3_++;
            }
         }
         return param1;
      }
      
      public function parseVoArr(param1:String) : Vector.<LocaleParseVo>
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Vector.<LocaleParseVo> = new Vector.<LocaleParseVo>();
         var _loc2_:Array = param1.match(reg);
         var _loc5_:int = _loc2_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = new LocaleParseVo(_loc2_[_loc6_]);
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function parseParamAdvance(param1:String, param2:Array) : String
      {
         var _loc10_:int = 0;
         var _loc3_:* = null;
         var _loc9_:* = null;
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc4_:Vector.<LocaleParseVo> = parseVoArr(param1);
         var _loc7_:int = _loc4_.length;
         var _loc6_:int = 0;
         _loc10_ = 0;
         for(; _loc10_ < _loc7_; _loc10_++)
         {
            _loc3_ = _loc4_[_loc10_];
            _loc5_ = _loc3_.index == -1?_loc6_:int(_loc3_.index);
            var _loc11_:* = _loc3_.key;
            if("value" !== _loc11_)
            {
               if("cardical" !== _loc11_)
               {
                  if("player" !== _loc11_)
                  {
                     if("stcItem" !== _loc11_)
                     {
                        if("stcNpc" !== _loc11_)
                        {
                           if("stcHorse" !== _loc11_)
                           {
                              if("item" !== _loc11_)
                              {
                                 if("teamGuajiID" !== _loc11_)
                                 {
                                    if("arr" !== _loc11_)
                                    {
                                       if("wealthVo" !== _loc11_)
                                       {
                                          continue;
                                       }
                                       _loc9_ = LinkUtils.wealthVo(param2[_loc5_],null,_loc3_.style);
                                    }
                                    else
                                    {
                                       _loc9_ = parseParamArr(_loc3_,param2[_loc5_]);
                                    }
                                 }
                                 else
                                 {
                                    _loc9_ = LinkUtils.teamGuajiInvite(param2[_loc5_]);
                                 }
                              }
                              else
                              {
                                 _loc9_ = LinkUtils.itemName(param2[_loc5_],null,_loc3_.style);
                              }
                           }
                           else
                           {
                              _loc9_ = LinkUtils.stcHorseName(param2[_loc5_]);
                           }
                        }
                        else
                        {
                           _loc9_ = LinkUtils.stcNpcName(param2[_loc5_]);
                        }
                     }
                     else
                     {
                        _loc9_ = LinkUtils.stcItemName(param2[_loc5_]);
                     }
                  }
                  else
                  {
                     _loc8_ = param2[_loc5_] as PlayerBaseInfo;
                     if(_loc8_)
                     {
                        _loc9_ = LabelMed.vipParam(VipUtils.vipInfoVo(_loc8_)) + LinkUtils.playerNameSmart(_loc8_.id,_loc8_.name,_loc8_.dist,ColorLib.getMilitaryColor(_loc8_.militaryRank));
                     }
                  }
               }
               else
               {
                  _loc9_ = nslm2.modules.footstones.localeModules.LocaleMgr.ins.getStr(int(_loc3_.paramArr[0]) + param2[_loc5_]);
               }
            }
            else
            {
               _loc9_ = param2[_loc5_];
            }
            param1 = param1.replace(_loc3_.oriStr1,_loc9_);
            _loc6_ = _loc6_ + 1;
         }
         return param1;
      }
      
      private function parseParamArr(param1:LocaleParseVo, param2:Array) : String
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc3_:Array = [];
         var _loc4_:String = param1.oriStr1.replace("arr" + ":","");
         var _loc6_:int = param2.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = param2[_loc7_];
            _loc3_[_loc7_] = parseParamAdvance(_loc4_,[_loc5_]);
            _loc7_++;
         }
         return _loc3_.join(" ");
      }
   }
}
