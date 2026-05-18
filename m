Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E531714F;
	Mon, 18 May 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097818; cv=none; b=MMXnKJlw1wsQ6DX0mh9cXhH/4XaCujAy+N7MoQxH2M1hc/fcTvzqGIzxX8mjxFUccEzPLkrkP/Su8jThmZns9uX33eEAnG46re/ZU1y1xqqQ1FyDJoAgRmAjMEfkagTZfd4UCzIkl7QkjAZuUadzx7bV92t22eYSg1YqOGwiTQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097818; c=relaxed/simple;
	bh=Lg7SHY79Ez90vizKKVcccnw95sWZhe3FLdlAUXK5a1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSCEerXYVUCfLbxk2r6CxBc+EnXSgVcPmHA3mBcNBNJ8qAFuFs4X59ngb0HzKrzI9jzeNbrplDwX8IIlQ82I90U4gHi5Eljbe2rcUbH3wfjflCszgbOy+Z0aYI86Fu0PkAkbQcam8rzQ70jpuxQvIKQaYItW3528W29E4O5wXnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=0GQm7RJ5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZJvKXuuX; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="0GQm7RJ5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZJvKXuuX"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D4328EC01E8;
	Mon, 18 May 2026 05:50:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 18 May 2026 05:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779097815;
	 x=1779184215; bh=v1InhRMGTE94+dyIJiJxl4Z17L0BhqwIO4O+ur7YkWQ=; b=
	0GQm7RJ5xGZUZjcXzgitunEUXB/zSRJeWI/aZ6MTJ+WDMoHemEQhmguld3/5RV84
	m/8esjH91BlFg6vVRtkUk65ygCl1GRovKeNv9PAk0ip/Z3UdqgeW+0ZamP5Rws/P
	6Q8w6byVI3NVKKHFcmGLVyofKrY487NwbsGQvpZfnO3KySpvrkd5jZbtemC9B6vm
	1Lmi+qS9exO87bg1k+P06SZM1m04HS3Ez1DC6hbnzGQQHZn7TvmiU5gkycsHYdYU
	7DZN1+l4r4BRXIKAaghBkIfTdifa0e9pFQb6lTZ1tB0K7ZI74/bKamWL/ETBMFe7
	W/SuNVNQr62ojtTyzwAgag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779097815; x=
	1779184215; bh=v1InhRMGTE94+dyIJiJxl4Z17L0BhqwIO4O+ur7YkWQ=; b=Z
	JvKXuuXU8AYICd+OjUKSVQgt5CHyrrtRu8jrAiHU+HpnP0d/YXUy9/an6S8C7r/+
	Gwcy7Ve6EC5ch5SGT++XD2dd37/cXodL5NTYNlFzJsN+xiIF8nz/yowBrvn/Wnma
	4TRXL6sMjidB7yECl0Qx5jEWk8nAlGAZpN5DvQxpBBUgfW0PpxSAaA/+ABARc3nj
	9ljj1pHvhHCI8RSwLpFRbIJvSJRAf3k3bR5fsscjRRBJ3GPjSO5l4Jd/tvP3wm7F
	eIGm6uMPZMtCNa/IxoSI0ZsuNLwlBqomYEIsZ4nIwRioalnApSqIuDDPnDsJbI90
	68N2J4KiJKO2e9vh2LGrw==
X-ME-Sender: <xms:1uAKagjWH1Z6sn3K4xIcIfWY2-BdNEG0JTUz_DhlYNyaM1J2hqXFmw>
    <xme:1uAKak4kHnyi-ctSU4dt3b8WzK7LkANYGUBdl0WEwiGBVBtUaZ9PV5U0AHj6UVQpC
    2EzwxxVQQwsNYPHG_vOs_jHGXPOZxhDyVFEkhwROgQCYpmh2R1o>
X-ME-Received: <xmr:1uAKalGkJtn3hPM3eVwFDcc-6Rfeo9Okxxad1PEVeuUsaX2dMAFglrT1y65_UH8Gsn9sfUABfbNsAlKyWz_ChTN5OJ63Y8meDuShFQJuEPS0m_DzIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeeuvghrnhgu
    ucfutghhuhgsvghrthcuoegsvghrnhgusegsshgsvghrnhgurdgtohhmqeenucggtffrrg
    htthgvrhhnpeetfedtheelgfehheevheetheelhfeujeeitdejvedvvdejtdfgffefhfet
    hfffveenucffohhmrghinheprghkrgdrmhhsnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsggvrhhnugessghssggvrhhnugdrtghomhdpnhgs
    pghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrshhmlh
    drshhilhgvnhgtvgesghhmrghilhdrtghomhdprhgtphhtthhopegsshgthhhusggvrhht
    seguughnrdgtohhmpdhrtghpthhtohepmhgvsegsvghrkhhotgdrtghomhdprhgtphhtth
    hopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthho
    pehmihhklhhoshesshiivghrvgguihdrhhhupdhrtghpthhtohepshgvtghurhhithihse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohgrnhhnvghlkhhoohhnghesghhmrghi
    lhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehiohdquhhrihhnghesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:1uAKamIn8qI2QYbtM-nyhi9NszAcGxQjHTPWs0cRBqk3PaRNxwBPWQ>
    <xmx:1uAKaigKJgN6LLjM8vPLld2SnFs9c1bPyx0YCmTGHbuQ2wR6VV48Dw>
    <xmx:1uAKakmA4MPhCiEBatj22-G9OPY64L2kHpO48seeqyBzC8rWgLzlbg>
    <xmx:1uAKapXLrvHRqmrBgud2emcnNRPjX8RLm9zLeztPIZ2DS0TachwPHw>
    <xmx:1-AKagW7j_HJdsTJFYcoRVUZKMGk0MboLT4AClI8CVnYKkOR3a16uB60>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 May 2026 05:50:13 -0400 (EDT)
Message-ID: <a44344bb-ad71-41f5-a3c5-81eb99442e5e@bsbernd.com>
Date: Mon, 18 May 2026 11:50:11 +0200
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fuse: wait for aborted connection before releasing
 last fuse_dev
To: Pavel Begunkov <asml.silence@gmail.com>,
 Bernd Schubert <bschubert@ddn.com>, Berkant Koc <me@berkoc.com>,
 Greg KH <gregkh@linuxfoundation.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: "security@kernel.org" <security@kernel.org>,
 Joanne Koong <joannelkoong@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, fuse-devel <fuse-devel@lists.linux.dev>
References: <20260517095846.fuse-iouring-uaf.dc5f5dbb71dc@berkoc.com>
 <2026051703-equinox-multitude-91e2@gregkh>
 <20260517-fuse-uaf-cover@berkoc.com> <20260517-fuse-uaf-patch2@berkoc.com>
 <08d3f6e0-7745-4084-995a-95ddb77f7f11@ddn.com>
 <9f3f3dc7-1c52-49b6-91d5-046f1fc7b2a8@gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <9f3f3dc7-1c52-49b6-91d5-046f1fc7b2a8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/18/26 11:06, Pavel Begunkov wrote:
> On 5/17/26 16:00, Bernd Schubert wrote:
>> On 5/17/26 14:59, Berkant Koc wrote:
>>> [You don't often get email from me@berkoc.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: Berkant Koc <me@berkoc.com>
>>>
>>> fuse_dev_release() on the last fuse_dev of a connection calls
>>> fuse_abort_conn(fc) and then immediately fuse_conn_put(fc). For io-uring
>>> backed connections fuse_abort_conn() reaches fuse_uring_abort(), which
>>> runs fuse_uring_teardown_all_queues() synchronously once and then
>>> schedules ring->async_teardown_work to run after
>>> FUSE_URING_TEARDOWN_INTERVAL (HZ/20). If the synchronous pass left
>>> queue_refs > 0 the work owns further accesses to ring->queues[*]->
>>> ent_avail_queue and ent_in_userspace entries.
>>>
>>> Meanwhile fuse_conn_put() can drop the last reference and arm
>>> delayed_release() via call_rcu(). After the RCU grace period
>>> delayed_release() calls fuse_uring_destruct(), which kfree()s the ring
>>> entries on each queue->ent_released list. The previously scheduled
>>> async_teardown_work then runs and walks per-queue lists that contain
>>> freed entries, producing a slab-use-after-free reported by KASAN at
>>> fuse_uring_teardown_all_queues+0xee reading ent->list.next from a
>>> freed kmalloc-192 region.
>>>
>>> fuse_wait_aborted() already exists for this purpose: it waits on
>>> fc->blocked_waitq for num_waiting to drain and then calls
>>> fuse_uring_wait_stopped_queues(), which waits for ring->queue_refs to
>>> reach zero. Call it between fuse_abort_conn() and fuse_conn_put() on
>>> the last-device path so the io-uring teardown work has fully drained
>>> before the connection can be torn down.
>>>
>>> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
>>> Cc: stable@vger.kernel.org # 6.14+
>>> Tested-by: Berkant Koc <me@berkoc.com>
>>> Signed-off-by: Berkant Koc <me@berkoc.com>
>>> ---
>>>   fs/fuse/dev.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>> index 5dda7080f4a9..7d9c06654a98 100644
>>> --- a/fs/fuse/dev.c
>>> +++ b/fs/fuse/dev.c
>>> @@ -2566,6 +2566,7 @@ int fuse_dev_release(struct inode *inode, struct file *file)
>>>                  if (last) {
>>>                          WARN_ON(fc->iq.fasync != NULL);
>>>                          fuse_abort_conn(fc);
>>> +                       fuse_wait_aborted(fc);
>>>                  }
>>>                  fuse_conn_put(fc);
>>>          }
>>
>> I might be wrong, but I don't think it is possible, Maybe Pavel or Jens
>> could help (added to CC). Basically as long as
>> fuse_uring_async_stop_queues() runs we do not have completed all
>> io-uring commands via io_uring_cmd_done() and as long as we do not have
>> completed these io-uring commands.
> 
> If I understand the question right, yes, fuse io_uring cmd requests hold
> a reference to the fuse file, so until you complete them the file will
> not get released.


Sorry, had totally messed up the phrase, can't read it myself.

What I mean is that the io-uring was set up with /dev/fuse as file and
as long as fuse holds non-completed 'struct io_uring_cmd *cmd' objects
there is a reference on the /dev/fuse fd, which blocks the call of
fuse_dev_release().


Thanks,
Bernd
