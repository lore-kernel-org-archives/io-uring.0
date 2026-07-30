Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E743E06E
	for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429166; cv=none; b=YiY0OXEpj6H/y6huqVCKzL1KaRVuW6WPQd6jqt8Kkr9jfBe0yoh4VxhOG4tqybe6RXadAkQ3Bl0qT5V36SFF9hXrmPy03SGnoEisiMtTAleziL5SoqL58JdkSCLWmykQLLpB9aSnMnpS2cFRph20xDQ+cukHTCO1dmFp/vBVj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429166; c=relaxed/simple;
	bh=9btGk5f2a/DceEfPaKkNA5+Plv7jzRhDTY3TO4vi+kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmI/Q3gkQWy1VQh1AwTKeK3melaSmsh/LvZy0Uo6PzpsVXgITOsoVD6iIbEaUXEJffF6VscTDrfwhIhwjBHqZd4xQvhnTbSrfczxaHo7B7fbqEw9ROeSSBOZLSuvFwDPDSpdQV/iLmET8/WBRRn/UNerp2yCUvfJ1v4Pc6NXg5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=LupAejho; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="LupAejho"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f0167e59a3so33425a34.0
        for <io-uring@vger.kernel.org>; Thu, 30 Jul 2026 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1785429164; x=1786033964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5C1EvvuLAlRHXA30Xxb4HI1T4XzyQlMzu71fYbXEDfw=;
        b=LupAejhoSWQSMcTguID4LkXupjL8lz8kU6zgSQXLMlpQ/6mSg35/KNvzn76jnPyTNg
         +C+qViZ7AtLW5Jhw3FjrFXUhe3GGVc4bsgrGEsy1edhrMTWTjoQDN3Vq+dlFuo8n6lKb
         +swwtcA+idGA5OpZfKzfzIlW0iyGbhxkt1hmPxLSThELq76uovoTt5ny1qEfknUWcJr7
         IesC2xFsOs1e2VLIcHOA7AcIk32KWOBGL6Kym/0Mbt4HJaYkGbrGxYrpXl38k0pVZxH8
         na5VqEQbz/vNCPheI8MufSCVUtRcyyWGhT8uwVvTqZ6exYCeuR+B/BjAoFBaWSLpddIg
         T/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429164; x=1786033964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5C1EvvuLAlRHXA30Xxb4HI1T4XzyQlMzu71fYbXEDfw=;
        b=oPSnEVbD+BYg/or2OuTwZU7cuwFsi+kouAw1rDRa1/XkO/5896B939T0QQKSOX3rcy
         ZE+gXY0LbdDWtI8cUeOfv15ugO3QL/xhmsm7nGc/Be63caNx/ekZBd/Jc88wIRSc8afG
         +Mjz5c9216Jp/izaOz02nUXwnwZ2QqEqWrwKXQzilZkHeYSGg0/vz0dKQG1f7F66tvQP
         MwD66GiN3HIiQbqQeSMPdcHmjmX5/oVg4KGQqRWRwl8BukVJZhpgoLm/CQkDnKOdDX/p
         Rm6RgO7URn9toCUMqowkJ08pKSBnOxvBuY/z4sHBYWMJb+3z+yplD9MSrUCPVYvFtLxp
         yEfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpdkpiyvd8U6BzKghuAIxDF7EezjbFP5gpWpKLSpt+RskicSUwobeDbHXVoB8PagYYbmCTVhcsIew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HCtK+xlRgt+ZrehOWmtUrxQTHW2e6cxVhzbL3yF71w5IDliq
	Vquan8hFYCTH07vB/wf3P65x5QQnJrNqs84ojhB6SQD4TNVLNQuA9XD0dlXHURZ+QIo=
X-Gm-Gg: AR+sD11eYvc3IKwL9jmtli+jGg0wRenjR94UeZ483wgXQfbd7KrPZ/e6mOQYNGcPwcC
	JzWUSGif12azNk9cK/M4sVx9Mbf9j9jJ1LJtx9Zu+TzV40c5cBSpyPW/0+oNtU3bidIK8STw9ZF
	69ZkGZslLvXsiScD4zo/0+KkaPNfFYYOFUOVKgSuyG5fILMU8S+NO05FOw3hunCcFchnvstJ230
	xBkBrg9VIAiz8t1Xz1NbIagCiSq6yzltW0cRjqjNS69CuOYAbrlwvVPcjTmtPt+JY5uY+7oZdXq
	6pggErVELY4UcySRwWW+FjWi7t0NyeeH+DVDNB6BveEb7f2MZxilnIVkRHNZBgiwZo3HiPEsUrt
	Cxi7S730MwTtRNuhD7jpg1PAFdl1WG5jIKhjXrelXpv1K/t7ZyQpwSY3Nw3KFavijuVVFRnSqAF
	MzWuX0l1BBra0L3JdzffJUiltS9B+68az3OR+OKWL1IAIZLxkFZUfxgfCquRPR1WppFk+ubxR6L
	fRuddah0KPhl1eEn1jiEutysYPpYItxZkKgiHrxq/lmagqgzUWQ461aRA==
X-Received: by 2002:a05:6820:3091:b0:6aa:4f21:dd20 with SMTP id 006d021491bc7-6acbc1db6cemr1962089eaf.64.1785429163783;
        Thu, 30 Jul 2026 09:32:43 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f00d8df72asm5110588a34.13.2026.07.30.09.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:32:43 -0700 (PDT)
Message-ID: <3766c1e2-bfb7-4c62-85d1-3cd4afbe289b@kernel.dk>
Date: Thu, 30 Jul 2026 10:32:42 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] io_uring/epoll: disallow adding an epoll file to an
 epoll context
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Xi Ruoyao <xry111@xry111.site>, io-uring@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, brauner@kernel.org,
 =?UTF-8?Q?Juan_Jos=C3=A9?= <soyjuanarbol@gmail.com>
References: <20260514140817.623026-1-axboe@kernel.dk>
 <20260514140817.623026-7-axboe@kernel.dk>
 <605939add4dfb674bd7ab39ef8dbd3fd22e754e4.camel@xry111.site>
 <427b15c8-c168-4e2a-ac38-b00dc00400d3@kernel.dk>
 <CAHk-=wjeSgFEr3WSO1C1sPP+fy+Mt5_EL9WXW-s11BOhD_S5Ag@mail.gmail.com>
 <a50c6a4d-5c25-4cbb-baac-f622728f2693@kernel.dk>
 <CAHk-=wjr6LoL+k1J076cSvRHVOdR5Wvh2J1HbwZUQ-BY5vxLKQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHk-=wjr6LoL+k1J076cSvRHVOdR5Wvh2J1HbwZUQ-BY5vxLKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 10:29 AM, Linus Torvalds wrote:
> On Thu, 30 Jul 2026 at 09:25, Jens Axboe <axboe@kernel.dk> wrote:
>>
>> Exactly, no other recourse here than to just revert it. Unfortunately
>> my io_uring-7.2 branch is from pre merging of the epoll changes, as those
>> went in separately. Hence I can either prep a revert for you separately,
>> or you can just revert cfa1539b24af yourself since you have the context
>> as well. Let me know what you prefer!
> 
> If you have other things pending for the next rc, let's do it in your
> tree and I'll get it through the normal channels.
> 
> And if the answer is "no pending pulls for rc6", I'll do the revert here.

I've got a few patches I'll ship tomorrow, so yeah let's just do it that
way then - I'll revert it locally.

-- 
Jens Axboe

