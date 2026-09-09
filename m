Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914C2931DF
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916223; cv=none; b=i44Fos8/1h+8jsMqJZKr6wFa9iszuoorENrJ/HgdhIiu7TyQMYelIOPtYDQXNAqwB2CQnZyopBW3UudIZ3lwGhCNk0n0nN9LToiST1Z2er7/RBGrMc0oluhZJoT3YnC2aOpzPfSllM/h1+AoUNFzjmo6/k/nz++wxbn6u75zLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916223; c=relaxed/simple;
	bh=/KNkqL8brsMMGc5Cqzr5HLntXTDWrBVEovCUk8D0+MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cR4J02ew7E8IfYPo5IIylIa9QxS6dM7FE60B5Xwsz1eC4Ve/ooPG69OqSjNfVOD3h8aXV4wEQb+LyyWEqydtd6/h+frV6yhyKMq980o4dpjyWrJE2tn8bu6YUM+n34Iy/WJWLoNHzkrSBgAIUIAB8HXn+7pd4uzSJLSsvZzDWvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NWZv+NG6; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NWZv+NG6"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f4f3683fbcso5211720a34.0
        for <io-uring@vger.kernel.org>; Tue, 08 Sep 2026 18:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788916221; x=1789521021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=NWZv+NG6ScWiJXBrzINv5nf+h2CGV4UewtnGQ7IVsT1w+viSyhB/HZqxuZbdSyN6NH
         fD1upKpbC5Ugif8JTdXzeAkgeGi7r8nqMLy+XbJjyUS4P4qdVwi/DLmAVmHvIZmeNcN0
         uNzLIQVzE42+2h9B7fCuUQIK4ASVycxHxnFyZN8uaKvqRxjTNeGJFXS/iknYk178z4/w
         Qaqtm/xrcpMtGqi0Johbxc+HvIn0dCXZ/xLQiYRFQjikoQ9iUR7H5l5lesstCH2OqiSM
         P9aigVKQGV+U02AZizU0hX58ZakAPxC7lZHwj4q1rjbdIncAjD71L3X9aRC8es1VDpEA
         abug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916221; x=1789521021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZczqCxuq41VAhV724eZUITtJnRnt+MmYaUhid2/07k=;
        b=pBsXk20uf3Jj7lT4x4OthXjaH9ua+i246zRuHOogEObzjZNvanZ1iT3fI9BOp8FNfw
         MgHYZa/83rvFPcOBcgxkclPhxImWJDlB+rx7t63iAycpEQYW9wBZdSoFzmF7fhCgGbPa
         NVWh+fGx1CJrMq76Ama/2YyRGfV9yvwOY4Y5jOcMKvOqa+C7JVc8+OclNidd5JSyMgQy
         YwMi7nrMl1QKB7N46YuvwSQi0FrniIxCsijHksRTBYBAzHfDNd+C/kH1YySnC22CtJ8S
         o0koXfFB4vv06Do8gceGJWep0uVbtAYKWPC3LRqtWMEoAOOazhIpFj0A0/w34cRFDFyf
         /KYw==
X-Forwarded-Encrypted: i=1; AKwUvBy1rVZuE+cmlYQH5dgJjrsbu+rij7+szqHHZnH1XxbM/7Nk2AumxU8UH7vWPUaParJ0zBYX0mSGaw==@vger.kernel.org
X-Gm-Message-State: AFuF++keBmtneXqtG4T2cjJPY4cz+WmwCxCNEfw/w5rOvGgKA9N6Q9Nr
	ZVvfI89LYQC46fhQ2y8ohge7UiCfQsu5JICyG0z/4ECxygLdjvDE2X7ezuR/L7r8/ZeTqY8M6lK
	Kib1Z1X0=
X-Gm-Gg: AYBFou3PaV6cLz4HFopx0YwKVJz3GyeyeguEhM8Ba7RS3AH2vJLLb75uFituZLRFjAV
	EgFFF3itkrfMB2VQVIs+O+cIkGb6ILbZHN1QaMIZo5MfvDpRaCFKzG566HroWRDH+LQqfIFboK7
	a+J8dCLcRYz6AGg4gYffvcgu9a+TBpkw0XZswByAwbKIs09cE8xH3CqzqAt56ZmoDZ+rrjJEuk1
	8Wjv4EaG2jIFtAb9boI5ED+eJzdCVahXIiq6GIwt7Acf/anLJg6CycrJKE8n0bRmvVjEQw7+JHD
	19VuJS7sDNfdsG1APuXupAQyFDUi+9ftXLrukTNFN5lY8Tqofo+O4OtmiIbG7R4FD8hmwhOaoMo
	YLNB3jEWY/l0DJXkQPVVO13mK+SjPtyb99cJwvpWmk9v83mKkbuNKH7N5Yw5JIgPiIexH4sffc9
	f6VPYgV33hxVgKC0o7iJIOWSLKr6q5aTAgqyLK/6FS9f5cwo05Ex/arF8UB62Z/s4J14mgt7rij
	w6V1yHWZQr8CDovr5aG50EgT/1azbzUk1j90jWDJ6HRaoiDjFU1zX05TQ==
X-Received: by 2002:a05:6830:8411:b0:7f9:5a3:c24a with SMTP id 46e09a7af769-7f905a3c4abmr10303149a34.33.1788916220674;
        Tue, 08 Sep 2026 18:10:20 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa642bc562sm16613685a34.16.2026.09.08.18.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 18:10:19 -0700 (PDT)
Message-ID: <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Date: Tue, 8 Sep 2026 19:10:18 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
To: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-7.3

-- 
Jens Axboe

