package nslm2.modules.funnies.busyActivity.questions.model
{
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import proto.Answer;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.ServerTimer;
   import proto.StaticQuestionModel;
   import proto.StaticQuestionModel.Row;
   import proto.StaticQuestionModel.KVPair;
   import nslm2.nets.sockets.ServerEngine;
   import proto.QuestionIsFinishRes;
   import com.mz.core.utils.ArrayUtil;
   
   public class QuestionModel
   {
      
      private static var _ins:nslm2.modules.funnies.busyActivity.questions.model.QuestionModel;
       
      
      private var _isFinish:Boolean = false;
      
      public var version:uint;
      
      private var questions:Array;
      
      private var configVo:nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
      
      public var title:String;
      
      public var desc:String;
      
      public var startTime:uint;
      
      public var endTime:uint;
      
      public function QuestionModel()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.busyActivity.questions.model.QuestionModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.busyActivity.questions.model.QuestionModel();
         }
         return _ins;
      }
      
      public function set isFinish(param1:Boolean) : void
      {
         _isFinish = param1;
         NpcFuncService.ins.changeCount(900600,!!param1?0:1);
      }
      
      public function get isFinish() : Boolean
      {
         return _isFinish;
      }
      
      public function getAnswer() : Array
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < questions.length)
         {
            _loc2_ = questions[_loc4_] as nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
            _loc3_ = new Answer();
            _loc3_.ans = _loc2_.answer;
            _loc3_.id = _loc2_.id;
            _loc1_.push(_loc3_);
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function get isOpen() : Boolean
      {
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(111);
         if(_loc1_)
         {
            return ServerTimer.ins.second >= _loc1_.startTm && ServerTimer.ins.second <= _loc1_.endTm;
         }
         return false;
      }
      
      public function initQuestions(param1:StaticQuestionModel) : void
      {
         var _loc8_:int = 0;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         this.version = param1.version;
         questions = [];
         _loc8_ = 0;
         while(_loc8_ < param1.rows.length)
         {
            _loc7_ = param1.rows[_loc8_] as Row;
            _loc4_ = new nslm2.modules.funnies.busyActivity.questions.model.QuestionVo();
            _loc4_.answerLabels = [];
            _loc5_ = false;
            _loc6_ = 0;
            while(_loc6_ < _loc7_.v.length)
            {
               _loc3_ = _loc7_.v[_loc6_] as KVPair;
               var _loc9_:* = _loc3_.k;
               if("tbl" !== _loc9_)
               {
                  if("level" !== _loc9_)
                  {
                     if("vip" !== _loc9_)
                     {
                        if("kind" !== _loc9_)
                        {
                           if("question" !== _loc9_)
                           {
                              if("value1" !== _loc9_)
                              {
                                 if("value2" !== _loc9_)
                                 {
                                    if("value3" !== _loc9_)
                                    {
                                       if("value4" !== _loc9_)
                                       {
                                          if("id" === _loc9_)
                                          {
                                             _loc4_.id = int(_loc3_.v);
                                          }
                                       }
                                       else
                                       {
                                          _loc4_.answerLabels[3] = _loc3_.v;
                                       }
                                    }
                                    else
                                    {
                                       _loc4_.answerLabels[2] = _loc3_.v;
                                    }
                                 }
                                 else
                                 {
                                    _loc4_.answerLabels[1] = _loc3_.v;
                                 }
                              }
                              else
                              {
                                 _loc4_.answerLabels[0] = _loc3_.v;
                              }
                           }
                           else
                           {
                              _loc4_.question = _loc3_.v;
                           }
                        }
                        else
                        {
                           _loc4_.type = int(_loc3_.v);
                        }
                     }
                     else
                     {
                        _loc4_.vip = int(_loc3_.v);
                     }
                  }
                  else
                  {
                     _loc4_.level = int(_loc3_.v);
                  }
               }
               else if(_loc3_.v == "config")
               {
                  _loc5_ = true;
                  configVo = _loc4_;
               }
               _loc6_++;
            }
            if(_loc5_ == false)
            {
               questions.push(_loc4_);
            }
            else
            {
               title = _loc4_.answerLabels[2];
               desc = _loc4_.answerLabels[3];
            }
            _loc8_++;
         }
         questions.sortOn("id",16);
         var _loc2_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(111);
         startTime = _loc2_.startTm;
         endTime = _loc2_.endTm;
         ServerEngine.ins.send(10040,null,onGetQuestionIsFinish);
      }
      
      private function onGetQuestionIsFinish(param1:QuestionIsFinishRes) : void
      {
         this.isFinish = param1.finish;
      }
      
      public function updateAnswer(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc2_ = param1[_loc4_] as Answer;
            _loc3_ = getQuestionById(_loc2_.id);
            _loc3_.answer = _loc2_.ans;
            _loc4_++;
         }
      }
      
      public function getQuestionById(param1:int) : nslm2.modules.funnies.busyActivity.questions.model.QuestionVo
      {
         return ArrayUtil.findByAttr(questions,"id",param1) as nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
      }
      
      public function getQuestionByPages() : Array
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         _loc1_.push(_loc2_);
         _loc4_ = 0;
         while(_loc4_ < questions.length)
         {
            _loc3_ = questions[_loc4_] as nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
            if(_loc3_.isShow())
            {
               if(_loc2_.length == 2 || _loc3_.isText())
               {
                  _loc2_ = [];
                  _loc1_.push(_loc2_);
               }
               _loc2_.push(_loc3_);
               _loc3_.showId = _loc4_ + 1;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function clearAllAnswer() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < questions.length)
         {
            _loc1_ = questions[_loc2_] as nslm2.modules.funnies.busyActivity.questions.model.QuestionVo;
            _loc1_.answer = "";
            _loc2_++;
         }
      }
   }
}
