Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3009349CD5
	for <io-uring@vger.kernel.org>; Tue, 12 May 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581717; cv=none; b=Y9x2jUeFwhdHhDmjb7m87Ql23XxJADpsxjLPNKC+RZZH3IRbRt7O0ZHR6nohZPP9tnytmlhRS3Gzm27AzoeurGMY+jatS7PxDj/IM0m8L2LiVOAeEd7LW/VnwyJqN/QaQpqtYDjEYthiUgdAvzuGs7INn/QQEc1VS0AiNPZRxj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581717; c=relaxed/simple;
	bh=NaAMaZ0bKG71oaPj9HHfGmZV0qYFxCPtr66OS72Tnok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJnv9iLPRgYXJtED3Z/6J1tbw3/dmKI1iaP1dwjYLY5usUjVTLf1o5AHOm6dYcUPgdW3Xc2jNGvlXkRi3WAgS3aS/kdBf/x8QdDf3QBPfFDleyeiNPdtXr5ImcwxvY1CEKR9vt52Wxc2Ktgi5zXSxMT3ZkYD+pP/pTZePz53rhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaIlfS36; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaIlfS36"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d146705b4so65532735e9.3
        for <io-uring@vger.kernel.org>; Tue, 12 May 2026 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778581712; x=1779186512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+rvi2uDnDxh7KewyaG1ZXvW90bkNCNdmlZWrmTYFyI=;
        b=BaIlfS36ZR2m73RKwDHJmmZYROP+UPK0ignZ6SneDb8Yq8F1e21p7AX7E2yer0UqmH
         9KEniKPuUBtt/uAO0eWagS8ekUZYG5mWxggyVFRjRVRJUhgy45z8KvTZiot02m/s0xq4
         zOBhGGroa+SYugSG+8pzwtWy2V05Rh+/dCFiaX3nh28J1GFwB12oYpgkSVosNOTBgYi3
         QiUi0GfoMsaGdjnusr8c0iHNmN/RnZs9dRPeMBnOhcB2DfPfw+vhZxyM8fJGxiYD6VoX
         sI7sp2Zm0PYbJBiTZ+Ve5ab7j0ezIDjMUMKdyB3jMVTurmNQd64qdH+D6SEo4bz7Fbdl
         ptCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581712; x=1779186512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+rvi2uDnDxh7KewyaG1ZXvW90bkNCNdmlZWrmTYFyI=;
        b=XxLMI6+xHiytNs5sJLFAHp+LOv5RFGFIBZzxixg8acaH2RiYAyz2nROmqchLRNgG1e
         bsW2u+ftxs79YZQufJxH2XTYqPcHeT1HnGHe90gBLh4mJzR3gQRI3mhLgA/19ncpHnb+
         rjaIbm2okXTIRTcdH91Jk10YATE7/qURxT8UTt05SjX9VOpT29aSd5TyknlPDzTHFRgD
         A4aDsZ91nppWUUIMWW/xtRQRx14zsOUs7i3ab9wNYcqaNWd8/i/AbWSRcbnMUK7Csa3m
         4Hlkrmi6jHOPYJCz+V4Q9MEKkxAYwtzX4ASnBj1HSSj2BSn8OPKa1UYpIMjP1wQd0YKk
         ftww==
X-Gm-Message-State: AOJu0Yz3p3HXwQzvkJuzdGVUXy2EzA0XlRTH2nFsP7CVZxMfKO534j6T
	ZZhvXD63qJNJhqDixQ6F4+cvvmXgIaPKvPvIScIJ+cT+OPlZ4WD3sQde8ryghA==
X-Gm-Gg: Acq92OEufKzhk+fYaTCjlS0SK0LXo2Pxul+3c5tI95uHv7gkDNuiA97elE5soAlGGPb
	4x/5lsFKI54mMfSh+IvxAJygb1CUl34VRyueXZwrxwYDCMObDoijOCOCqZlpH/9bzD4OdcKHX+Y
	bVH4SD2bYp3NeNrn9leAAT2Np3OTcSTTAiU2FvU+b7ShJZP/aXFrBWlQhuEr0QFPUu2aQ2dADh5
	nrvcjVZ/DKVo83M5k361OuYgMyA07er1P00oJtYamlSNETJkZ2vgqjf/2oSwrUh+1/jVjYEQM5e
	2tQCcpxedk+wv92pBDvE6o5oDzDSX9jtUzFpJbSWriMIi/AYDYwecojGknCTgj3OY2hMwcV3POH
	vWrszWaMgevyYn40j+BmLiJIyuvl9xvVWvVipPxlbFKAbhsRhWSiKs8q7BGpx8qau1WlQx1cbMl
	fYTmsrK5k8hHZJk3UWSU1AXUOiacLOpNjARDST3Raw6g8q6BwhH3rgQtgWUZGC+7JHWmgpuu4BL
	ekvCmhNi9jErrDq8snkSTRBleeO1kX3iA0q2Rassv1IOwZGTA==
X-Received: by 2002:a05:600c:548e:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48e8fe774d6mr35255135e9.17.1778581711685;
        Tue, 12 May 2026 03:28:31 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::372? ([2620:10d:c092:600::1:8c90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ba2aaec3asm1285744f8f.15.2026.05.12.03.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:28:31 -0700 (PDT)
Message-ID: <a9600af1-f9a2-466c-8ec9-d0d437083f4b@gmail.com>
Date: Tue, 12 May 2026 11:28:27 +0100
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/6] dynamic area addition
To: io-uring@vger.kernel.org
Cc: netdev@vger.kernel.org
References: <cover.1778581283.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <cover.1778581283.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 11:25, Pavel Begunkov wrote:
> Currently, the user needs to give memory for the data upfront
> when registering a zcrx instance, but it's not always easy to
> predict for the user how much it will need. This series adds
> a way to add more memory / areas at runtime.

There are some tests in the branch:

https://github.com/isilence/liburing/tree/zcrx/area-create

-- 
Pavel Begunkov

